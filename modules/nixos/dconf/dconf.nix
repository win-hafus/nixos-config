{ pkgs }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.gsconnect.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        ];
      };
      "org/gnome/desktop/interface" = {
        gtk-theme = "Catppuccin-Macchiato-Standard-Lavender-Dark";
        color-scheme = "prefer-dark";
      };
    };
  };
}
