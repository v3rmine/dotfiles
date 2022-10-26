{ pkgs, ... }:
let
  python3WithPackages = with pkgs.python3.pkgs; [
    pkgs.python3
    pip
    setuptools
    pynvim
    # lief
    ipykernel
  ];
in {
  home.packages = with pkgs; [
    firefox
    thunderbird
    vscode
    dbeaver
    # Rust
    rustup
    # Node
    # nodejs
    # yarn
    # Nix
    nil
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
  ] ++ python3WithPackages;
}
