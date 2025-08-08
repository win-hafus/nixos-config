{ config, ... }:
{
  catppuccin.kvantum = {
    enable = true;
    flavor = "macchiato";
    accent = "lavender";
    apply = true;
  };
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };
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
}
