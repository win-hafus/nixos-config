{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    fzf

    waybar
    wl-clipboard
    xwayland-satellite

    alacritty
    qbittorrent
    vlc
    imv
    mpv
    rofi
    wlogout
    reaper
    # reaper-sws-extension
    discord
    pavucontrol
    nautilus
    obs-studio
    qbittorrent
    telegram-desktop
    vscode
    wakatime-cli
    obsidian
    libreoffice-qt

    hunspell
    hunspellDicts.ru_RU

    flatpak

    ranger
    helix
    tree
    curl
    p7zip
    playerctl
    # hyprpaper
    swww
    hyprpicker
    hyprshot
    nixfmt

    cmake
    cli11

    python313
    python313Packages.pip
    libnotify
    go

    lm_sensors
  ];
}
