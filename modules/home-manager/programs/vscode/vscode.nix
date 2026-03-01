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
        
        "window.menuBarVisibility" = "toggle";
        "terminal.external.linuxExec" = "alacritty";
        "files.autoSave" = "afterDelay";
        "security.workspace.trust.untrustedFiles" = "open";
        "liveServer.settings.donotShowInfoMsg" = true;
        "redhat.telemetry.enabled" = true;
        "explorer.confirmDelete" = false;
        
        "editor" = {
          "tabSize" = 2;
          "fontFamily" = "Cascadia Code";
          "fontLigatures" = "'calt', 'ss01'";
          "formatOnSave" = true;
          "minimap.enabled" = false;
          "defaultFormatter" = "esbenp.prettier-vscode";
        };
        
        "workbench" = {
          "colorTheme" = "Catppuccin Macchiato";
          "iconTheme" = "catppuccin-macchiato";
          "activityBar.location" = "default";
        };

        "nix" = {
          "enableLanguageServer" = true;
          "serverPath" = "nixd";
          "serverSettings" = {
            nixd.formatting.command = [ "nixfmt" ];
          };
        };
        
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
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
