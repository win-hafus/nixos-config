{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../modules/home-manager/hyprland/hyprland.nix
    ../../modules/home-manager/packages/packages.nix
    ../../modules/home-manager/programs/programs.nix
    ../../modules/home-manager/services/services.nix
    ../../modules/home-manager/reaper/reaper.nix
    ../../modules/home-manager/themes/themes.nix
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

  services.ssh-agent.enable = true;
  programs.home-manager.enable = true;
}
