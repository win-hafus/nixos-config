{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils

    alacritty
    inputs.zen-browser.packages."${pkgs.system}".default

    helix
    wget
    git
    htop
    curl
    p7zip
    unzip
    zip
    jq
    ffmpeg
    gnumake
    gh
    cachix

    sops
    age

    (catppuccin-kvantum.override {
      accent = "lavender";
      variant = "macchiato";
    })
    (catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "lavender";
      font = "Casacdia Code";
      fontSize = "11";
    })

    openvpn
    networkmanager-openvpn

    nodejs

    libnotify
    libGL
    libGLU
    glfw
    mesa
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-console
    gnome-online-accounts
    gnome-music
    gnome-user-docs
    gnome-remote-desktop
    gnome-weather
    gnome-text-editor
    gnome-color-manager
    gnome-calculator
    gnome-contacts
    gnome-maps
    gnome-connections
    gnome-disk-utility
    gnome-calendar
    gnome-clocks
    gnome-logs
    gnome-system-monitor
    gnome-font-viewer
    gnome-screenshot
    gnome-characters
    simple-scan
    totem
    epiphany
    geary
    evince
    loupe
    snapshot
    cheese
    baobab
    yelp
  ];

  services.desktopManager.gnome.enable = true;
}
