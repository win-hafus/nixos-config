{ pkgs, config, ... }:

{
  catppuccin.rofi = {
    enable = true;
    flavor = "macchiato";

  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Cascadia Code 9";

    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      fixed-height = false;
      auto-select = true;
      location = 0;
      xoffset = 0;
      yoffset = 0;
      lines = 8;
      columns = 1;
      padding = 5;
      element-padding = 4;
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "window" = {
          border = mkLiteral "0";
          border-radius = 8;
          height = mkLiteral ''"auto"'';
          max-height = mkLiteral "50%";
          width = mkLiteral "40%";
          max-width = mkLiteral "600px";
          background-color = mkLiteral "@mantle";
          anchor = mkLiteral "center";
        };

        "mainbox" = {
          spacing = 0;
          orientation = mkLiteral "vertical";
          children = mkLiteral "[inputbar, message, listview]";
        };

        "inputbar" = {
          color = mkLiteral "@text";
          padding = 10;
          background-color = mkLiteral "@mantle";
          children = mkLiteral "[prompt, entry]";
        };

        "prompt" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "@lavender";
          margin = mkLiteral "0 8px 0 0";
        };

        "entry" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "@text";
        };

        "message" = {
          padding = 8;
          background-color = mkLiteral "@overlay0";
          text-color = mkLiteral "@subtext1";
        };

        "listview" = {
          padding = 3;
          border = mkLiteral "0";
          background-color = mkLiteral "@mantle";
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
        };

        "textbox" = {
          text-color = mkLiteral "@text";
          background-color = mkLiteral "inherit";
        };

        "element" = {
          padding = 4;
          vertical-align = mkLiteral "0.5";
          border-radius = 8;
          background-color = mkLiteral "@surface0";
          text-color = mkLiteral "@text";
        };

        "element selected" = {
          background-color = mkLiteral "@overlay0";
          text-color = mkLiteral "@lavender";
        };

        "element active" = {
          background-color = mkLiteral "@peach";
          text-color = mkLiteral "@mantle";
        };

        "element urgent" = {
          background-color = mkLiteral "@red";
          text-color = mkLiteral "@mantle";
        };

        "element-icon" = {
          size = 24;
          margin = mkLiteral "0 8px 0 0";
          vertical-align = mkLiteral "0.5";
          background-color = mkLiteral "inherit";
        };

        "element-text" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          font = mkLiteral ''"Cascadia Code 9"'';
        };

        "mode-switcher" = {
          background-color = mkLiteral "@surface0";
        };

        "button selected" = {
          background-color = mkLiteral "@lavender";
          text-color = mkLiteral "@mantle";
        };
      };
  };
}
