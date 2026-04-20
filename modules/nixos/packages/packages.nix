{
  pkgs,
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

    # -------- QuickShell -----------------------------------------------
    (inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      withWayland = true;
      withHyprland = true;
    })
    qt6.qt5compat
    qt6.qtpositioning
    qt6.qtmultimedia
    qt6.qtsvg
    qt6.qtwayland
    qt6.qtimageformats
    qt6.qtvirtualkeyboard
    kdePackages.kirigami.unwrapped
    kdePackages.syntax-highlighting
    matugen # генерация цветов из обоев
    hyprpicker # пипетка
    hypridle # idle daemonиe
    (python3.withPackages (
      ps: with ps; [
        pillow
        materialyoucolor
        opencv4
      ]
    ))
    cliphist # история буфера обмена
    imagemagick # для превью обоев
    libqalculate
    songrec
    ddcutil
    zenity
    kdePackages.kdialog
    bc
    grim
    brightnessctl

    material-symbols
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
