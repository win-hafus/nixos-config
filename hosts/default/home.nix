{
  config,
  pkgs,
  inputs,
  ...
}:
{
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
    ../../modules/home-manager/hyprlock/hyprlock.nix
    ../../modules/home-manager/vscode/vscode.nix
    ../../modules/home-manager/hyprpaper/hyprpaper.nix
    ../../modules/home-manager/wlogout/wlogout.nix
    ../../modules/home-manager/packages/packages.nix
  ];

  home = {
    username = "hfv5";
    homeDirectory = "/home/hfv5";
    stateVersion = "25.05";


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
    extraConfig = {
      core.sshCommand = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519";
    };
  };

  services.ssh-agent.enable = true;
  programs.ssh = {
    addKeysToAgent = "yes";
    extraConfig = ''
      Host *
        IdentityFile ~/.ssh/id_ed25519
    '';
  };
  
  programs.mangohud.enable = true;

  xdg.configFile =
    let
      qtctConfig = ''
        [Appearance]
        icon_theme = "Papirus-Dark"
        style = "kvantum"
      '';
    in
    {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=Catppuccin-Macchiato-Green
      '';
      "qt5ct/qt5ct.conf".text = qtctConfig;
      "qt6ct/qt6ct.conf".text = qtctConfig;
    };

  programs.home-manager.enable = true;
}
