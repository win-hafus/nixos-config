{ config, ... }:
{
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

    inputs.quickshell.packages.${pkgs.system}.default

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
    gnome-characters gnome-font-viewer
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
}