{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    fzf

    waybar
    wl-clipboard
    clipse
    xwayland-satellite
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome

    swww
    hyprpicker
    hyprshot
    wlogout
    rofi

    alacritty
    ranger
    helix
    tree
    curl
    p7zip
    playerctl
    nixfmt
    nixd

    vlc
    imv
    mpv
    reaper
    # reaper-sws-extension
    obs-studio
    pavucontrol

    telegram-desktop
    discord
    qbittorrent

    obsidian
    libreoffice-qt
    vscode
    wakatime-cli

    nautilus
    flatpak
    lm_sensors

    hunspell
    hunspellDicts.ru_RU
  ];
}
