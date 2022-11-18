# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # boot.kernelPackages = pkgs.linuxPackages_5_15;
  # boot.extraModulePackages = with config.boot.kernelPackages; [
  #   rtl8821ce
  #   perf
  # ];
  # https://github.com/NixOS/nixpkgs/issues/97682#issuecomment-691295299
  # boot.kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
  # security.allowUserNamespaces = true;

  networking.hostName = "johan-nixos-simplx"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # HACK: https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
  networking.networkmanager.unmanaged = [ "interface-name:tailscale*" ];

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.utf8";
    LC_IDENTIFICATION = "fr_FR.utf8";
    LC_MEASUREMENT = "fr_FR.utf8";
    LC_MONETARY = "fr_FR.utf8";
    LC_NAME = "fr_FR.utf8";
    LC_NUMERIC = "fr_FR.utf8";
    LC_PAPER = "fr_FR.utf8";
    LC_TELEPHONE = "fr_FR.utf8";
    LC_TIME = "fr_FR.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable natural scrolling
  services.xserver.libinput.touchpad.naturalScrolling = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us,fr";
    xkbVariant = "";
    xkbOptions = "grp:win_space_toggle";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable logitech receiver
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      neovim = super.neovim.override {
        viAlias = false;
        vimAlias = false;
      };
    })
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johan = {
    isNormalUser = true;
    description = "johan";
    shell = pkgs.nushell;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      gnome.gnome-keyring
      plasma5Packages.qtstyleplugin-kvantum
      sweet
      home-manager
      piper
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    neovim
    docker
    git
    bash
    zsh
    nushell
    plocate
    file
    gcc
    clang
    stdenv.bootstrapTools
    gnumake
    bintools-unwrapped
    man-pages
    openssl
    pkg-config-unwrapped
    jq
    unzip
    ripgrep
    xclip
    tailscale
    google-chrome
    via
    syncthing
  ];
  environment.shells = with pkgs; [ zsh ];
  environment.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";   
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.ratbagd.enable = true;
  services.blueman.enable = true;

  # Enable via device detection
  services.udev.packages = [ pkgs.via ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Cron jobs
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *    johan    /home/johan/sysmet-update --db /home/johan/sysmet.db"
    ];
  };

  # Enable docker daemon
  virtualisation.docker.enable = true;

  # Enable the gnome keyring (E.G for VSCode)
  services.gnome.gnome-keyring.enable = true;

  # Enable the tailscale service
  services.tailscale.enable = true;
  # warning: Strict reverse path filtering breaks Tailscale exit node use and some subnet routing setups. Consider setting `networking.firewall.checkReversePath` = 'loose'
  networking.firewall.checkReversePath = "loose"; 

  # Enable syncthing
  services.syncthing = {
    enable = true;
    user = "johan";
    dataDir = "/home/johan/Documents";
    configDir = "/home/johan/Documents/.syncthing";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment? yes

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
