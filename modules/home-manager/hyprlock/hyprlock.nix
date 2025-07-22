{ pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = "${builtins.toString ./wallpaper.png}";
        blur_passes = 3;
        blur_size = 1;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      animations = {
        enabled = false;
      };
      label = [
        # Time
        {
          text = "cmd[update:1000] echo \"$(date '+%I:%M%p')\"";
          color = "rgb(110, 154, 65)";
          font_size = 120;
          font_family = "Fira Code Bold";
          position = "0, -140";
          halign = "center";
          valign = "top";
        }
        
        # Date
        {
          text = "cmd[update:1000] echo \"<span>$(date '+%A, %d %B')</span>\"";
          color = "rgba(225, 225, 225, 0.75)";
          font_size = 30;
          font_family = "Fira Code";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }

        # Login Picture
        {
          text = "";
          color = "rgba(225, 225, 225, 0.65)";
          font_size = 120;
          position = "0, 60";
          halign = "center";
          valign = "center";
        }

        # Greeting user
        {
          text = "Hello, $USER";
          color = "rgba(255, 255, 255, 0.65)";
          font_size = 25;
          font_family = "Fira Code Bold";
          halign = "center";
          valign = "center";
        }

        # Song Name and Artist
        {
          text = "cmd[update:1000] ${pkgs.writeShellScript "songdetail" ''
            song_info=$(playerctl metadata --format '{{title}}      {{artist}}')
            echo \"$song_info\"
          ''}";
          color = "rgba(235, 219, 178, .75)";
          font_size = 16;
          font_family = "Cascadia Code";
          position = "0, 80";
          halign = "center";
          valign = "bottom";
        }
      ];

      # Input Field
      input-field = {
        size = "290, 60";
        outline_thickness = 2;
        dots_size = 0.1;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(60, 56, 54, 0.35)";
        font_color = "rgb(200, 200, 200)";
        font_family = "Cascadia Code Italic";
        fade_on_empty = false;
        placeholder_text = "'<i><span foreground=\"#ffffff99\">Use Me</span></i>'";
        hide_input = false;
        position = "0, -140";
        halign = "center";
        valign = "center";
      };
    };
  };
}
