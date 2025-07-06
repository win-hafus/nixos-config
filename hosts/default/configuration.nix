{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/systemd/systemd.nix
    ../../modules/nixos/services/services.nix
    ../../modules/nixos/network/network.nix
    #TODO: fix ssh with RSA
    # ../../modules/nixos/ssh/ssh.nix
    inputs.home-manager.nixosModules.default
    inputs.catppuccin.nixosModules.catppuccin
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  xdg = {
    autostart.enable = true;
    mime.enable = true;
    menus.enable = true;
    icons.enable = true;
    sounds.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
      configPackages = [ pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk];
      config.common.default = "gnome";
    };
  };

  environment = {
    shells = [ pkgs.zsh ];
    variables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_STYLE_OVERRIDE = "kvantum";
    };
  };

  users.users.hfv5 = {
    isNormalUser = true;
    description = "Hafus";
    extraGroups = [ "networkmanager" "wheel" "storage" "video" "audio" ];
    shell = pkgs.zsh;
  };


  programs = {
    xwayland.enable = true;
    fish.enable = true;
    zsh.enable = true;
    dconf.enable = true;
    firefox.enable = true;
    niri.enable = true;
    waybar.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils

    niri
    waybar
    alacritty

    helix
    wget
    git
    htop

    curl
    p7zip
    unzip
    zip

    home-manager

    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnome-session

    (catppuccin-kvantum.override {
      accent = "lavender";
      variant = "macchiato";
    })
    (catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Casacdia Code";
      fontSize = "11";
    })

    nodejs
    openvpn
    networkmanager-openvpn

    libGL
    libGLU
    glfw
    mesa
  ];

  environment.gnome.excludePackages = (with pkgs; [
    atomix 
    cheese 
    epiphany 
    evince 
    geary 
    gedit 
    gnome-characters
    gnome-font-viewer
    gnome-calculator
    gnome-clocks
    gnome-contacts
    gnome-control-center
    gnome-calendar
    gnome-disk-utility
    gnome-maps
    gnome-software
    gnome-text-editor
    gnome-weather
    eog
    evince
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    gnome-logs
    gnome-photos
    gnome-secrets
    gnome-user-docs
    gnome-sound-recorder
    hitori 
    iagno 
    tali 
    totem 
  ]);

  fonts.packages = with pkgs; [
    cascadia-code
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontDir.enable = true;

  security.rtkit.enable = true;

  system.stateVersion = "25.05";
}
