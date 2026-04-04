{
  username,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitors
      monitor = "HDMI-A-1,1920x1080@180,0x0,1.0";

      # Programs
      "$terminal" = "alacritty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun";
      "$mainMod" = "SUPER";

      # Autostart
      exec-once = [
        "waybar &"
        "clipse -listen"
        "Telegram &"
        "discord &"
        "awww-daemon &"
        "discover-overlay"
      ];

      # Environment variables
      env = [
        "XCURSOR_SIZE,16"
        "HYPRCURSOR_SIZE,16"
      ];

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 50;
        border_size = 2;
        "col.active_border" = "rgba(b7bdf8ff)";
        "col.inactive_border" = "rgba(1e1e2e00)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration
      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          scale = 0.5;
          color = "rgba(00000022)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          new_optimizations = true;
          vibrancy = 0.1696;
        };
      };

      # Animations
      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
          "popup,0.05,0.9,0.1,1.05"
          "fade_out,0.1,0.9,0.2,1"
          "pop_in,0.1,1,0.25,1.1"
          "fade_in,0.05,0.95,0.1,1"
          "windowMove,0.25,1,0.5,1"
          "snapBack,0.6,0,0.4,1"
        ];

        animation = [
          "global,1,10,default"
          "border,1,2,default"
          "windows,1,4.79,popup"
          "windowsIn,1,4,pop_in,popin"
          "windowsOut,1,4,pop_in,popin 87%"
          "windowsMove,1,1.5,windowMove"
          "fadeIn,1,1.73,fade_in"
          "fadeOut,1,1.46,fade_out"
          "fade,1,3.03,quick"
          "fadeSwitch,1,2,easeInOutCubic"
          "fadeDim,1,2.5,almostLinear"
          "layers,1,3.81,easeOutQuint"
          "layersIn,1,4,easeOutQuint,fade"
          "layersOut,1,1.5,linear,fade"
          "fadeLayersIn,1,1.79,almostLinear"
          "fadeLayersOut,1,1.39,almostLinear"
          "workspaces,1,1.94,almostLinear,fade"
          "workspacesIn,1,1.21,linear,slide"
          "workspacesOut,1,1.94,linear,slide"
        ];
      };

      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master layout
      master = {
        new_status = "master";
      };

      # Misc
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      # Input
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      # Keybindings
      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod SHIFT, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, P, exec, $menu"
        "$mainMod SHIFT, V, exec, $terminal --class clipse -e clipse"
        ", Insert, exec, bash -c 'f=$(hyprshot -m region -o /home/${username}/Pictures/Screenshots) && [ -f \"$f\" ] && wl-copy < \"$f\"'"
        "SHIFT, Insert, exec, bash -c 'f=$(hyprshot -m window -o /home/${username}/Pictures/Screenshots) && [ -f \"$f\" ] && wl-copy < \"$f\"'"
        "CONTROL, Insert, exec, bash -c 'f=$(hyprshot -m output -o /home/${username}/Pictures/Screenshots) && [ -f \"$f\" ] && wl-copy < \"$f\"'"
        # hyprlock
        "$mainMod, U, exec, hyprlock"

        # float
        "$mainMod, G, pin"
        "$mainMod, C, centerwindow"

        # tiling
        "$mainMod, V, togglefloating,"
        "$mainMod, B, layoutmsg, togglesplit, 0"
        "$mainMod, T, pseudo,"
        "$mainMod, F, fullscreen, 1"
        "$mainMod SHIFT, F, fullscreen, 0"

        # Move focus
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Move windows
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        # Resize windows
        "$mainMod CONTROL, H, resizeactive, -20% 0"
        "$mainMod CONTROL, L, resizeactive, 20% 0"
        "$mainMod CONTROL, K, resizeactive, 0 20%"
        "$mainMod CONTROL, J, resizeactive, 0 -20%"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Mouse workspace navigation
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Layer rules
      layerrule = "animation slide, match:namespace notifications";

      # Window rules
      windowrule = [
        "float on, match:class ^(imv)$"
        "float on, match:class ^(mpv)$"
        "float on, match:class ^(vlc)$"
        "float on, match:class ^(clipse)$"
        "center on, match:class ^(imv)$"
        "center on, match:class ^(mpv)$"
        "center on, match:class ^(vlc)$"
        "size 622 652, match:class ^(clipse)$"
        "move cursor -311 -326, match:class ^(clipse)$"
        "suppress_event maximize, match:class .*"
        "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"
      ];
    };
  };
}
