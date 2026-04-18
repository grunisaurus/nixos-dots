# Edit this configuration file to define what should be installed on your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    #   ./luks/luks.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11 - ignored through the hyprland portal, see hyprland.nix home-manager config
  services.xserver.xkb = {
    layout = "de,us";
    variant = ",";
    options = "grp:win_space_toggle";
  };

  services.seatd.enable = true;
  services.seatd.user = "grunisaurus";
  services.pulseaudio.enable = false;
  # Configure console keymap
  console.keyMap = "de";

  hardware = {
    bluetooth.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.grunisaurus = {
    isNormalUser = true;
    description = "Nils Grunwald";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    dunst
    (python3.withPackages (ps: [
      #     ps.tensorflow
      ps.matplotlib
      ps.numpy
      ps.pandas
      ps.scikit-learn
      ps.notebook
      ps.pygame
    ]))
    libnotify
    kitty
    ghostty
    dbeaver-bin
    zathura
    brightnessctl
    zip
    unzip
    wineWow64Packages.waylandFull
    winetricks
    go
    git
    fzf
    hyprshot
    vscode
    fastfetch
    discord
    libreoffice-qt
    texliveFull
    qpdf
    jetbrains.idea-oss
    jetbrains.goland
    android-studio
    nushell
    tipp10
    alsa-utils
    hyprsunset
    zoom-us
    # There are known security issues in this version of the ciscoPacketTracer because it is based on a fairly old version of chromium.
    #ciscoPacketTracer8
    unixtools.netstat
    lsof
    gradle
    thunderbird
    #currently the url is not available for fetching (403 FORBIDDEN)
    #visual-paradigm-ce
    htop
    librewolf
    dissent
    keepassxc
    logseq
    localsend
    blueman
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21.override {
      enableJavaFX = true;
      openjfx21 = pkgs.openjfx21.override {withWebKit = true;};
    };
  };

  xdg.portal.enable = true;
  #xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [3050 53317];
    allowedUDPPorts = [53317];
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Fira Code"];
      };
    };
  };

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."x86_64-linux".hyprland;

  programs.tmux.enable = true;

  #systemd.services.firebird.serviceConfig.ExecStart = lib.mkForce "${pkgs.firebird}/bin/firebird";

  #  services.firebird = {
  #    enable = true;
  #    package = pkgs.firebird.override { superServer = true; };
  #    user = "grunisaurus";
  #  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.bash.shellAliases = {
    sudo = "sudo ";
    docker-firebird = "docker run -e FIREBIRD_ROOT_PASSWORD=masterkey -e FIREBIRD_USER=grunisaurus -e FIREBIRD_PASSWORD=firebird -e FIREBIRD_DATABASE=mirror.fdb -e FIREBIRD_DATABASE_DEFAULT_CHARSET=UTF8 -v ./data:/var/lib/firebird/data -p 3050:3050 firebirdsql/firebird";
  };
}
