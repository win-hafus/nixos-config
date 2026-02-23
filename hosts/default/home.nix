{
  config,
  username,
  ...
}:
{
  imports = [
    ../../modules/home-manager/home-modules.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";

    sessionVariables = {
      EDITOR = "hx";
      ZSH_CUSTOM = "${config.home.homeDirectory}/.oh-my-zsh/custom";
    };
  };

  services.ssh-agent.enable = true;
  programs.home-manager.enable = true;
}
