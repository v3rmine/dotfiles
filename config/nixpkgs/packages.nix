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
  ]);
  python3WithPackages = pkgs.python3.withPackages pythonPackages;
in {
  home.packages = (with pkgs; [
    firefox
    thunderbird
    vscode
    dbeaver
    # Rust
    rustup
    mold
    # Python
    python3WithPackages
    # Node
    # nodejs
    # yarn
    # Python
    python3WithPackages
    # Lua
    selene
    luaPackages.luacheck
    # Nix
    nil
    rnix-lsp
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
