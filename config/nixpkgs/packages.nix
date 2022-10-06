{ pkgs, ... }:
let
  python3WithPackages = with pkgs.python3.pkgs; [
    pkgs.python3
    pip
    setuptools
    pynvim
  ];
in {
  home.packages = with pkgs; [
    firefox
    kate
    thunderbird
    vscode
    kitty
    asdf-vm
    nodejs
    yarn
    starship
    rustup
    lazygit
    httpie
    fzf
    shellcheck
    slack
  ] ++ python3WithPackages;
}
