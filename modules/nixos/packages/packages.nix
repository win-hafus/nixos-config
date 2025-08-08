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
    (inputs.zen-browser.packages."${system}".default.override {
      policies = {
        disableTelemetry = true;
      };
    })

    helix
    wget
    git
    htop
    (flameshot.override { enableWlrSupport = true; })

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
