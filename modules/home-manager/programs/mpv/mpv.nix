{
  catppuccin.mpv = {
    enable = true;
    accent = "lavender";
    flavor = "macchiato";
  };
  programs.mpv = {
    enable = true;
    config = {
      profile = "high-quality";
      autofit-larger = "1280x720";
    };
  };
}
