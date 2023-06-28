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
  home.username = "johan";
  home.homeDirectory = "/home/johan";
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  services.espanso = {
    # enable = true;
    matches = [
      { trigger = ":whoknows:"; replace = "¯\\_(ツ)_/¯"; }
      { trigger = "<3"; replace = "♡"; }
      { trigger = "`a"; replace = "à"; }
      { trigger = "`A"; replace = "à"; }
      { trigger = "^A"; replace = "Â"; }
      { trigger = "^a"; replace = "â"; }
      { trigger = ".:a"; replace = "ä"; }
      { trigger = ".:A"; replace = "Ä"; }
      { trigger = "`e"; replace = "è"; }
      { trigger = "`E"; replace = "È"; }
      { trigger = "'e"; replace = "é"; }
      { trigger = "'E"; replace = "É"; }
      { trigger = "^e"; replace = "ê"; }
      { trigger = "^E"; replace = "Ê"; }
      { trigger = "^o"; replace = "ô"; }
      { trigger = "^O"; replace = "Ô"; }
      { trigger = "`u"; replace = "ù"; }
      { trigger = "`U"; replace = "Ù"; }
      { trigger = ",c"; replace = "ç"; }
      { trigger = ",C"; replace = "Ç"; }
      { trigger = "a-e"; replace = "æ"; }
      { trigger = "A-E"; replace = "Æ"; }
      { trigger = "o-e"; replace = "œ"; }
      { trigger = "O-E"; replace = "Œ"; }
    ];
  };
}
