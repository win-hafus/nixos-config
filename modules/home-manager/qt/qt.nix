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
}
