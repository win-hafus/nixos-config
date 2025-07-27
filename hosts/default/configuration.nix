{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/systemd/systemd.nix
    ../../modules/nixos/services/services.nix
    ../../modules/nixos/network/network.nix
    ../../modules/nixos/packages/packages.nix
    ../../modules/nixos/amneziawg/amneziawg.nix
    ../../modules/nixos/openvpn/openvpn.nix
    ../../modules/nixos/ssh/ssh.nix
    ../../modules/nixos/grub/grub.nix
    inputs.home-manager.nixosModules.default
    inputs.catppuccin.nixosModules.catppuccin
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
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
      xdgOpenUsePortal = false;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];
      configPackages = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];
      config.common.default = "hyprland";
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
    extraGroups = [
      "networkmanager"
      "wheel"
      "storage"
      "video"
      "audio"
    ];
    shell = pkgs.zsh;
  };

  programs = {
    xwayland.enable = true;
    fish.enable = true;
    zsh.enable = true;
    dconf.enable = true;
    firefox.enable = true;
    # waybar.enable = true;
    hyprlock.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    gamemode.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

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
