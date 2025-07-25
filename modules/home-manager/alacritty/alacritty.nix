{
  catppuccin.alacritty.flavor = "macchiato";
  catppuccin.alacritty.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "CascadiaCode";
          style = "Regular";
        };
        bold = {
          family = "CascadiaCode";
          style = "Bold";
        };
        italic = {
          family = "CascadiaCode";
          style = "Italic";
        };
        size = 9;
        glyph_offset = {
          x = 0;
          y = 0;
        };
        builtin_box_drawing = true;
      };
      cursor.style = {
        shape = "Beam";
        blinking = "Off";
      };
      window = {
        blur = true;
        opacity = 0.5;
      };
    };
  };
}
