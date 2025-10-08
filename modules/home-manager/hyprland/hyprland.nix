{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ################
      ### MONITORS ###
      ################
      monitor=HDMI-A-1,1920x1080@180,0x0,1.0


      ###################
      ### MY PROGRAMS ###
      ###################
      $terminal = alacritty
      $fileManager = nautilus
      $menu = rofi -show drun


      #################
      ### AUTOSTART ###
      #################
      exec-once = hyprpaper
      exec-once = waybar
      exec-once = Telegram

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################
      env = XCURSOR_SIZE,16
      env = HYPRCURSOR_SIZE,16


      ###################
      ### PERMISSIONS ###
      ###################
      # ecosystem {
      #   enforce_permissions = 1
      # }

      # permission = /usr/(bin|local/bin)/grim, screencopy, allow
      # permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
      # permission = /usr/(bin|local/bin)/hyprpm, plugin, allow


      #####################
      ### LOOK AND FEEL ###
      #####################

      general {
          gaps_in = 5
          gaps_out = 50

          border_size = 2
          col.active_border = rgba(b7bdf8ff)
          col.inactive_border = rgba(1e1e2e00)
          resize_on_border = true
          allow_tearing = false

          layout = dwindle
      }

      decoration {
          rounding = 8
          rounding_power = 2

          # Change transparency of focused and unfocused windows
          active_opacity = 1.0
          inactive_opacity = 1.0

          shadow {
              enabled = true
              range = 4
              render_power = 3
              scale = 0.5
              color = rgba(00000022)
          }

          blur {
              enabled = true
              size = 3
              passes = 3
              new_optimizations = true

              vibrancy = 0.1696
          }
      }

      animations {
          enabled = yes, please :)

          bezier = easeOutQuint,0.23,1,0.32,1
          bezier = easeInOutCubic,0.65,0.05,0.36,1
          bezier = linear,0,0,1,1
          bezier = almostLinear,0.5,0.5,0.75,1.0
          bezier = quick,0.15,0,0.1,1

          bezier = popup, 0.05, 0.9, 0.1, 1.05
          bezier = fade_out, 0.1, 0.9, 0.2, 1

          bezier = pop_in, 0.1, 1, 0.25, 1.1       
          bezier = fade_in, 0.05, 0.95, 0.1, 1     

          animation = global, 1, 10, default
          animation = border, 1, 2, default
          animation = windows, 1, 4.79, popup
          animation = windowsIn, 1, 4, pop_in, popin
          animation = windowsOut, 1, 4, pop_in, popin 87%
          animation = fadeIn, 1, 1.73, fade_in
          animation = fadeOut, 1, 1.46, fade_out
          animation = fade, 1, 3.03, quick
          animation = layers, 1, 3.81, easeOutQuint
          animation = layersIn, 1, 4, easeOutQuint, fade
          animation = layersOut, 1, 1.5, linear, fade
          animation = fadeLayersIn, 1, 1.79, almostLinear
          animation = fadeLayersOut, 1, 1.39, almostLinear
          animation = workspaces, 1, 1.94, almostLinear, fade
          animation = workspacesIn, 1, 1.21, linear, slide
          animation = workspacesOut, 1, 1.94, linear, slide

      }

      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_status = master
      }

      misc {
          force_default_wallpaper = 0
          disable_hyprland_logo = true
      }

      #############
      ### INPUT ###
      #############

      input {
          kb_layout = us,ru
          kb_variant =
          kb_model =
          kb_options = grp:alt_shift_toggle
          kb_rules =

          follow_mouse = 1

          sensitivity = 0

          touchpad {
              natural_scroll = true
          }
      }
      # gestures {
          # workspace_swipe = true
      # }

      ###################
      ### KEYBINDINGS ###
      ###################
      $mainMod = SUPER

      bind = $mainMod, Return, exec, $terminal
      bind = $mainMod SHIFT, C, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, E, exec, $fileManager
      bind = $mainMod, P, exec, $menu
      bind = , Insert, exec, hyprshot -m region -f Pictures/Screenshots/$(date +%T-%d.%m.%Y).png

      # hyprlock
      bind = $mainMod, U, exec, hyprlock

      # float
      bind = $mainMod, G, pin
      bind = $mainMod, C, centerwindow

      # tyling
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, B, togglesplit,
      bind = $mainMod, T, pseudo,
      bind = $mainMod, F, fullscreen, 1
      bind = $mainMod SHIFT, F, fullscreen, 0

      # Move focus with mainMod + arrow keys
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d

      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, L, movewindow, r
      bind = $mainMod SHIFT, K, movewindow, u
      bind = $mainMod SHIFT, J, movewindow, d

      bind = $mainMod CONTROL, H, resizeactive, -20% 0
      bind = $mainMod CONTROL, L, resizeactive, 20% 0
      bind = $mainMod CONTROL, K, resizeactive, 0 20%
      bind = $mainMod CONTROL, J, resizeactive, 0 -20%

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10


      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # Laptop multimedia keys for volume and LCD brightness
      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
      bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

      # Requires playerctl
      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPause, exec, playerctl play-pause
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################
      layerrule = animation slide,notifications
      layerrule = blur,notifications
      layerrule = ignorezero,notifications

      windowrule = float,class:^(imv)$
      windowrule = float,class:^(mpv)$
      windowrule = float,class:^(vlc)$
      windowrule = center,class:^(imv)$
      windowrule = center,class:^(mpv)$
      windowrule = center,class:^(vlc)$

      # Ignore maximize requests from apps. You'll probably like this.
      windowrule = suppressevent maximize, class:.*

      # Fix some dragging issues with XWayland
      windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
    '';
  };
}
