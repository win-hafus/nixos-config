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
        redhat.vscode-yaml
        wakatime.vscode-wakatime
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        esbenp.prettier-vscode
        jnoortheen.nix-ide
        eamodio.gitlens
        github.copilot-chat
        catppuccin.catppuccin-vsc-icons
        catppuccin.catppuccin-vsc
    ];

      userSettings = {
        "editor.tabSize" = 2;
        "editor.fontFamily" = "Cascadia Code";
        "editor.fontLigatures" = "'calt', 'ss01'";
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";

        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "catppuccin-macchiato";
        "workbench.activityBar.location" = "default";

        "window.menuBarVisibility" = "toggle";
        "terminal.external.linuxExec" = "alacritty";
        "explorer.confirmDelete" = false;
        "files.autoSave" = "afterDelay";
        "security.workspace.trust.untrustedFiles" = "open";
        "liveServer.settings.donotShowInfoMsg" = true;

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          nixd.formatting.command = [ "nixfmt" ];
        };

        "redhat.telemetry.enabled" = true;
      };
    };
  };

  home.activation.setupWakatime = lib.hm.dag.entryAfter [ "writeBoundary" "sops-nix" ] ''
    if [ -f ${config.sops.secrets.wakatime-key.path} ]; then
      $DRY_RUN_CMD echo "[settings]" > ${config.home.homeDirectory}/.wakatime.cfg
      $DRY_RUN_CMD echo "api_key = $(cat ${config.sops.secrets.wakatime-key.path})" >> ${config.home.homeDirectory}/.wakatime.cfg
    fi
  '';
}
