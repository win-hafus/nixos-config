{
  config,
  username,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/home-manager/home-modules.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    sessionVariables = {
      EDITOR = "hx";
      ZSH_CUSTOM = "${config.home.homeDirectory}/.oh-my-zsh/custom";
      QML_IMPORT_PATH = "${pkgs.kdePackages.kirigami}/lib/qt-6/qml:/run/current-system/sw/lib/qt-6/qml";
    };
  };

  services.ssh-agent.enable = true;
  programs.home-manager.enable = true;
}
