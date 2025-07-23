{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-green-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "green" ];
        size = "standard";
        variant = "macchiato";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "green";
      };
    };
    cursorTheme = {
      name = "catppuccin-macchiato-dark-cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "catppuccin-macchiato-dark-cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = 16;
  };
}
