{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        bbenoist.nix
        jnoortheen.nix-ide
        esbenp.prettier-vscode
        eamodio.gitlens
        wakatime.vscode-wakatime
      ];
      userSettings = {
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
        "prettier.useTabs" = true;
        "git.autofetch" = true;
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "catppuccin-macchiato";
        "editor.fontFamily" = "'Cascadia Code', 'monospace', monospace";
        "editor.fontLigatures" = "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'";
      };
    };
  };

  # Wakatime looks for API key in ~/.wakatime.cfg
  home.activation.setupWakatime = lib.hm.dag.entryAfter ["writeBoundary" "sops-nix"] ''
    if [ -f ${config.sops.secrets.wakatime-key.path} ]; then
      $DRY_RUN_CMD echo "[settings]" > ${config.home.homeDirectory}/.wakatime.cfg
      $DRY_RUN_CMD echo "api_key = $(cat ${config.sops.secrets.wakatime-key.path})" >> ${config.home.homeDirectory}/.wakatime.cfg
    fi
  '';
}