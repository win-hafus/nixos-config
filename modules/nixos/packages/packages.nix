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
    inputs.zen-browser.packages."${system}".default

    helix
    wget
    git
    htop

    curl
    p7zip
    unzip
    zip
    jq

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
}
