{ config, pkgs, inputs, ... }:
{
  imports = [
    # ../../modules/home-manager/oh-my-zsh/zsh.nix
    ../../modules/home-manager/rofi/rofi.nix
    ../../modules/home-manager/helix/helix.nix
    ../../modules/home-manager/ranger/ranger.nix
    ../../modules/home-manager/reaper/reaper.nix
    ../../modules/home-manager/gtk/gtk.nix
    ../../modules/home-manager/qt/qt.nix
    ../../modules/home-manager/waybar/waybar.nix
  ];

  home = {
    username = "hfv5";
    homeDirectory = "/home/hfv5";
    stateVersion = "25.05";

    packages = with pkgs; [
      zsh
      oh-my-zsh
      fzf

      waybar
      niri
      mako
      wl-clipboard
      xwayland-satellite

      alacritty
      qbittorrent
      vlc
      imv
      mpv
      rofi-wayland
      reaper
      reaper-sws-extension
      discord
      pavucontrol
      nautilus
      obs-studio
      qbittorrent
      telegram-desktop

      flatpak

      ranger
      helix
      swww
      eww
      tree
      curl
      p7zip

      dropbox-cli
      amneziawg-tools amneziawg-go
  
      rocmPackages.llvm.clang-unwrapped
      lsp-ai
      helix-gpt
      taplo
      rustc
      python313
      python313Packages.pip
      libnotify

      lm_sensors
    ];

    sessionVariables = {
      EDITOR = "hx";
      ZSH_CUSTOM = "${config.home.homeDirectory}/.oh-my-zsh/custom";
    };
  };

  xdg.configFile = let
    qtctConfig = ''
      [Appearance]
      icon_theme = "Papirus-Dark"
      style = "kvantum"
    '';
  in {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Catppuccin-Macchiato-Lavender
    '';
    "qt5ct/qt5ct.conf".text = qtctConfig;
    "qt6ct/qt6ct.conf".text = qtctConfig;
  };

  programs.home-manager.enable = true;
}
