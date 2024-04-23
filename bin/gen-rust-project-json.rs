#!/usr/bin/env rust-script
//! ```cargo
//! [dependencies]
//! clap = { version = "4.1.8", features = ["derive"] }
//! eyre = "0.6.8"
//! path-absolutize = "3.0.14"
//! serde = { version = "1.0.156", features = ["derive"] }
//! serde_json = "1.0.95"
//!
//! paths = { git = "https://github.com/rust-lang/rust-analyzer.git", tag = "2023-04-10" }
//! project-model = { git = "https://github.com/rust-lang/rust-analyzer.git", tag = "2023-04-10" }
//! base-db = { git = "https://github.com/rust-lang/rust-analyzer.git", tag = "2023-04-10" }
//! cfg = { git = "https://github.com/rust-lang/rust-analyzer.git", tag = "2023-04-10" }
//! vfs = { git = "https://github.com/rust-lang/rust-analyzer.git", tag = "2023-04-10" }
//! ```

use std::{
    collections::{HashMap, HashSet},
    ffi::OsStr,
    path::PathBuf,
    process::Command,
};

use clap::Parser;
use eyre::{ensure, eyre, Context as _, Result};
use path_absolutize::Absolutize as _;
use paths::AbsPathBuf;
use project_model::{CargoConfig, ProjectManifest, ProjectWorkspace, RustLibSource, Sysroot};
use serde::Serialize;

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// The rust-script script file path.
    script: PathBuf,

    /// The rust-script executable path.
    #[arg(long, default_value = "rust-script")]
    rust_script: PathBuf,
}

fn get_project_dir(rust_script: impl AsRef<OsStr>, script: impl AsRef<OsStr>) -> Result<PathBuf> {
    let output = Command::new(rust_script)
        .arg("--package")
        .arg(script)
        .output()
        .wrap_err("unable to run rust-script to get the package path")?;
    ensure!(
        output.status.success(),
        "tried to obtain the package path from rust-script, but rust-script failed with status code {:?}",
        output.status.code()
    );
    let output = String::from_utf8(output.stdout).wrap_err(
        "tried to obtain the package path from rust-script, but the output wasn't valid as utf8 string",
    )?;
    Ok(PathBuf::from(output.trim_end()))
}

#[derive(Serialize, Debug)]
struct RustProject {
    sysroot: PathBuf,
    sysroot_src: PathBuf,
    crates: Vec<Crate>,
}
#[derive(Serialize, Debug)]
struct Crate {
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    display_name: Option<String>,
    root_module: PathBuf,
    edition: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    version: Option<String>,
    deps: Vec<Dep>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    #[serde(default)]
    cfg: Vec<String>,

    is_proc_macro: bool,

    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    proc_macro_dylib_path: Option<PathBuf>,

    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    repository: Option<String>,
}
#[derive(Serialize, Debug)]
struct Dep {
    #[serde(rename = "crate")]
    krate: usize,
    name: String,
}

fn main() -> Result<()> {
    let args = Args::parse();
    let project_dir: AbsPathBuf = get_project_dir(&args.rust_script, &args.script)?
        .try_into()
        .map_err(|d| eyre!("project dir `{d:?}` wasn't an absolute path"))?;
    let sysroot = Sysroot::discover(&project_dir, &Default::default()).unwrap();

    let manifest = ProjectManifest::from_manifest_file(project_dir.join("Cargo.toml"))
        .map_err(|e| eyre!("unable to obtain manifest path: {e:?}"))?;
    eyre::ensure!(
        matches!(manifest, ProjectManifest::CargoToml(_)),
        "project manifest wasn't Cargo.toml"
    );

    let mut config = CargoConfig::default();
    config.sysroot = Some(RustLibSource::Path(sysroot.root().to_path_buf()));
    config.rustc_source = Some(RustLibSource::Discover);

    let ws = ProjectWorkspace::load(manifest, &config, &|_| {})
        .map_err(|e| eyre!("unable to load workspace: {e:?}"))?;

    let script = AbsPathBuf::try_from(
        args.script
            .absolutize()
            .wrap_err("unable to obtain absolute path of script")?
            .to_path_buf(),
    )
    .expect("absolutize returned non-absolute path???");

    let mut path_to_id = HashMap::new();
    let mut id_to_path = HashMap::new();
    let (crate_graph, proc_macro_paths) = ws.to_crate_graph(
        &mut |path| {
            let path = if path.parent() == Some(&project_dir) {
                // Translate the script path!
                script.clone()
            } else {
                path.to_owned()
            };
            let n = path_to_id.len() as u32;
            let ret = vfs::FileId(path_to_id.entry(path.to_owned()).or_insert(n).clone());
            id_to_path
                .entry(ret.clone())
                .or_insert_with(|| path.to_owned());
            Some(ret)
        },
        &Default::default(),
    );

    let mut crate_ids = vec![];
    let mut crate_id_to_index = HashMap::new();
    for id in crate_graph.iter() {
        crate_ids.push(id);
        crate_id_to_index.insert(id, crate_id_to_index.len());
    }

    let cfg_keys_to_ignore: HashSet<&'static str> = HashSet::from_iter([
        "debug_assertions",
        "panic",
        "target_abi",
        "target_arch",
        "target_endian",
        "target_env",
        "target_family",
        "target_feature",
        "target_has_atomic",
        "target_has_atomic_equal_alignment",
        "target_has_atomic_load_store",
        "target_os",
        "target_pointer_width",
        "target_thread_local",
        "target_vendor",
        "unix",
        "windows",
    ]);

    let mut crates = vec![];
    for id in crate_ids {
        let data = &crate_graph[id];
        let display_name = data
            .display_name
            .as_ref()
            .map(|name| name.canonical_name().to_owned());

        let root_module = id_to_path[&data.root_file_id].clone().into();
        let edition = match data.edition {
            base_db::Edition::Edition2015 => "2015",
            base_db::Edition::Edition2018 => "2018",
            base_db::Edition::Edition2021 => "2021",
        }
        .to_owned();
        let deps = data
            .dependencies
            .iter()
            .map(|dep| Dep {
                krate: crate_id_to_index[&dep.crate_id],
                name: dep.name.to_string(),
            })
            .collect();
        let cfg: Vec<_> = data
            .cfg_options
            .get_cfg_keys()
            .filter(|key| !cfg_keys_to_ignore.contains(key.as_str()))
            .flat_map(|key| {
                data.cfg_options
                    .check(&cfg::CfgExpr::Atom(cfg::CfgAtom::Flag(key.clone())))
                    .filter(|x| *x)
                    .map(|_| format!("{key}"))
                    .into_iter()
                    .chain(
                        data.cfg_options
                            .get_cfg_values(key)
                            // TODO: Escape?
                            .map(move |value| format!(r#"{key}="{value}""#)),
                    )
            })
            .collect();
        let proc_macro_dylib_path = proc_macro_paths
            .get(&id)
            .and_then(|v| v.as_ref().ok().map(|v| v.1.clone().into()));
        let repository = match &data.origin {
            base_db::CrateOrigin::Local { repo, .. }
            | base_db::CrateOrigin::Library { repo, .. } => repo.clone(),
            _ => None,
        };

        crates.push(Crate {
            display_name,
            root_module,
            edition,
            version: data.version.clone(),
            deps,
            cfg,
            is_proc_macro: data.is_proc_macro,
            proc_macro_dylib_path,
            repository,
        });
    }

    let project = RustProject {
        sysroot: sysroot.root().to_owned().into(),
        sysroot_src: sysroot.src_root().to_owned().into(),
        crates,
    };

    let json = serde_json::to_string_pretty(&project).wrap_err("unable to serialize to json")?;
    println!("{json}");
    Ok(())
}