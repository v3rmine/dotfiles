{ pkgs, ... }:
let
  buildPythonPackage = pkgs.python3Packages.buildPythonPackage;
  fetchPypi = pkgs.python3Packages.fetchPypi;
  instaloader = buildPythonPackage rec {
    pname = "instaloader";
    version = "4.9.5";
    format = "wheel";
    src = fetchPypi rec {
      inherit pname version format;
      sha256 = "";
      dist = python;
      python = "py3";
    };
  };
  ov_lief = buildPythonPackage rec {
    pname = "lief";
    version = "0.12.2";
    format = "wheel";
    src = fetchPypi rec {
      inherit pname version format;
      sha256 = "";
      dist = python;
      python = "py3";
    };
  };
  pythonPackages = python-packages: (with python-packages; [
    pip
    setuptools
    wheel
    pynvim
    jupyter
    ipython
    ipykernel
    openai
  ]);
  python3WithPackages = pkgs.python3.withPackages pythonPackages;
in {
  home.packages = (with pkgs; [
    vlc
    firefox
    thunderbird
    vscode
    dbeaver
    lapce
    # Rust
    rustup
    mold
    lld
    # Python
    python3WithPackages
    # Node
    # nodejs
    # yarn
    # Lua
    lua
    selene
    luaPackages.luacheck
    luaPackages.readline
    # Nix
    nil
    rnix-lsp
    # Fennel lang
    fennel
    fnlfmt
    luaPackages.fennel
    # Git
    lazygit
    # Shell
    starship
    httpie
    kitty
    fzf
    shellcheck
    # Communication
    slack
    # Notes
    obsidian
    # Keyboard
    qmk
    espanso
    # FS
    fuse
    fuse3
  ]);
  
  #nixpkgs.overlays = [
  #  (self: super: {
  #    python3 = super.python3.override {
  #      packageOverrides = pself: psuper: {
  #        lief = (super.python3.pkgs.toPythonModule (super.lief.overrideAttrs (oldAttrs: 
  #          let 
  #            pyEnv = psuper.python.withPackages (ps: [ ps.setuptools ]);
  #         in rec {
  #            version = "0.12.2";
  #            src = super.fetchFromGitHub {
  #              owner = "lief-project";
  ##              repo = "LIEF";
  #              rev = version;
  ##              sha256 = "sha256-5n3AWzSTImLY8v/mc1mwiNb4/opFZOTXSJwizbUMYvU=";
  ###            };
  #            buildPhase = ''
  #              runHook preBuild
  #              ${pyEnv.interpreter} setup.py --sdk build --parallel=$NIX_BUILD_CORES
  #              runHook postBuild
  #            '';
  #          }
  #        ))).py;
  #      };
  #    };
  #  })
  #];
}
