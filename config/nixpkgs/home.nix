{ pkgs, ... }: {
  imports = [
    ./packages.nix
  ];

  home.keyboard = {
    layout = "us,fr";
    variant = "";
  };
}
