{
  pkgs,
  inputs,
  username,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core-modules.nix
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
    terminal-exec = {
      enable = true;
      settings.default = [ "alacritty.desktop" ];
    };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
      config = {
        common.default = "*";
        hyprland.default = [
          "hyprland"
          "gtk"
        ];
        gnome.default = [
          "gnome"
          "gtk"
        ];
      };
    };
  };

  environment = {
    shells = [ pkgs.zsh ];
    variables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_STYLE_OVERRIDE = "kvantum";
    };
  };

  users.users.${username} = {
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

  nix.settings.trusted-users = [
    "root"
    "${username}"
  ];

  programs = {
    xwayland.enable = true;
    zsh.enable = true;
    amnezia-vpn.enable = true;
    coolercontrol.enable = true;
    kdeconnect.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    gamemode.enable = true;
    java.enable = true;

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

  system.stateVersion = "26.05";
}
