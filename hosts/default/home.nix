{ config, pkgs, inputs, ... }: {
  imports = [
    ../../modules/home-manager/oh-my-zsh/zsh.nix
    ../../modules/home-manager/rofi/rofi.nix
    ../../modules/home-manager/helix/helix.nix
    ../../modules/home-manager/ranger/ranger.nix
    ../../modules/home-manager/reaper/reaper.nix
    ../../modules/home-manager/gtk/gtk.nix
    ../../modules/home-manager/qt/qt.nix
    ../../modules/home-manager/waybar/waybar.nix
    ../../modules/home-manager/hyprland/hyprland.nix
    ../../modules/home-manager/alacritty/alacritty.nix
    ../../modules/home-manager/mako/mako.nix
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
      vscode
      spotify

      flatpak

      ranger
      helix
      swww
      eww
      tree
      curl
      p7zip

      cmake
      qt6.full
      qt6.qtwayland
      qt6.qtshadertools
      spirv-tools
      pkg-config
      jemalloc
      cli11

      dropbox-cli
      amneziawg-tools
      amneziawg-go

      rocmPackages.llvm.clang-unwrapped
      taplo
      python313
      python313Packages.pip
      libnotify
      go

      lm_sensors
    ];

    sessionVariables = {
      EDITOR = "hx";
      ZSH_CUSTOM = "${config.home.homeDirectory}/.oh-my-zsh/custom";
    };
  };
  wayland.windowManager.hyprland.enable = true;

  programs.git = {
    enable = true;
    userName = "win-hafus";
    userEmail = "konstantin.pirs@gmail.com";
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
      theme=Catppuccin-Macchiato-Green
    '';
    "qt5ct/qt5ct.conf".text = qtctConfig;
    "qt6ct/qt6ct.conf".text = qtctConfig;
  };

  programs.home-manager.enable = true;
}
