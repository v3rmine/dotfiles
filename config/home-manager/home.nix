{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "johan";
  home.homeDirectory = "/home/johan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Cross-platform graphical process/system monitor with a customizable interface
    bottom
    # du + rust = dust. Like du but more intuitive
    dust
    # Next gen ls command
    lsd
    # Cat(1) clone with syntax highlighting and Git integration
    bat
    # Interactive process viewer
    htop
    # Command line HTTP client whose goal is to make CLI human-friendly
    httpie
    # Command-line benchmarking tool
    hyperfine
    # Free and open source utility for network discovery and security auditing
    nmap
    # Command-line tool to download videos from YouTube.com and other sites (youtube-dl fork)
    yt-dlp
    # Simple terminal UI for git commands
    lazygit
    # Backup program that is fast, efficient and secure
    restic
    # Tool for building, changing, and versioning infrastructure
    opentofu
    # Unprivileged sandboxing tool
    bubblewrap
    # Feature-rich Nix language server interoperating with C++ nix
    nixd
    # Yet another language server for Nix
    nil
    # An opinionated formatter for Nix
    nixfmt-classic
    # Swiss army knife of lossless video/audio editing
    losslesscut-bin
    
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/johan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
