{ config, pkgs, ... }:

{
  imports = [ ./style.nix  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "custom/music" "clock" ];
        modules-right = [ "tray" "network" "pulseaudio" "pulseaudio#microphone" "custom/power" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = " {icon} ";
        };

        "custom/music" = {
          format = "󰎇 {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "playerctl metadata --format='{{ artist }} -- {{ title }}'";
          on-click = "playerctl play-pause";
          max-length = 20;
        };

        clock = {
          timezone = "Europe/Moscow";
          format-alt = "󰥔 {:%d/%m/%Y}";
          format = "󰥔 {:%H:%M}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#a6adc8'><b>{}</b></span>";
              weekdays = "<span color='#a6adc8'><b>{}</b></span>";
              today = "<span color='#a6adc8'><b>{}</b></span>";
              days = "<span color='#555869'><b>{}</b></span>";
            };
          };
        };

        tray = {
          icon-size = 13;
          spacing = 10;
        };

        network = {
          tooltip = true;
          format-wifi = "  {essid}";
          format-ethernet = "󰈀 ";
          tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 ";
          tooltip-format-disconnected = "Disconnected";
          format-alt = " {bandwidthDownBytes}  {bandwidthUpBytes}";
          interval = 2;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁 Muted";
          tooltip = false;
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "  Muted";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "wlogout &";
          format = "󰐥";
        };

        "custom/vpn" = {
          format = "󰖂 {}";
          tooltip = false;
          escape = true;
          exec = "/home/hfv5/.local/bin/vpn/vpn-bar";
          on-click = "/home/hfv5/.local/bin/vpn/vpn-rofi";
          exec-on-event = "on-click";
          interval = 1;
        };
      };
    };
  };
}
