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

    waybar
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
    sops
    age
    gnumake
    gh

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

    nodejs
    openvpn
    networkmanager-openvpn

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
  ];

  services.desktopManager.gnome.enable = true;
}
