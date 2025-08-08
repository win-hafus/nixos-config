{ pkgs, lib, ... }:
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
}
