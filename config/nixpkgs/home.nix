{ pkgs, ... }: {
  imports = [
    ./packages.nix
  ];
  # HACK: https://github.com/nix-community/home-manager/issues/3344
  manual.manpages.enable = false;
  home.keyboard = {
    layout = "us,fr";
    variant = "";
  };
}
