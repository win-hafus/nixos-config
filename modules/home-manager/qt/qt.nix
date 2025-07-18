{config, ...}:
{
  catppuccin.kvantum = {
    enable = true;
    flavor = "macchiato";
    accent = "green";
    apply = true;
  };
  qt = {
    enable = true;
    # platformTheme = "qtct";
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };
}
