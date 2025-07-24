{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils

    waybar
    alacritty

    helix
    wget
    git
    htop
    (flameshot.override { enableWlrSupport = true; })
    grim
    slurp

    curl
    p7zip
    unzip
    zip
    jq

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
}
