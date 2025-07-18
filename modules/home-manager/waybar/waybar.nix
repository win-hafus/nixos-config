{ pkgs, ... }:
{
  imports = [
    ./style.nix
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = [
          "eDP-1"
        ];
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "clock" "pulseaudio" ];
        modules-right = [ "network" "custom/warpcheck" "niri/language" "battery" "power-profiles-daemon" "custom/power" "tray"];

        "clock" = {
          timezone = "Europe/Moscow";
          format = " {:%H:%M}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "custom/warpcheck" = {
          format = "󰢩  {text}";
          exec = pkgs.writeShellScript "warpcheck"''
            if [[ $(ip link | grep "WARP") ]]; then
            	echo "on" &
            else
            	echo "off" &
            fi
          '';
          interval = 10;
        };

        "custom/power" = {
          format = "";
          on-click = "eww open powermenu";
        };

        "network" = {
        	interface = "wlp1s0";
        	format = "{ifname}";
        	format-wifi = "{essid} ({signalStrength}%) ";
        	format-ethernet = "{ifname} ";
        	format-disconnected = "";
        	tooltip-format = "{ifname}";
        	tooltip-format-wifi = "{essid} ({signalStrength}%) ";
        	tooltip-format-ethernet = "{ifname} ";
        	tooltip-format-disconnected = "Disconnected";
        	max-length = 50;
        };

        "niri/language" = {
          format-en = "us";
          format-ru = "ru";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}";
          format-charging = "{icon}󱐋 {capacity}";
          format-alt = "{icon}";
          format-icons = ["" "" "" "" ""];
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile = {profile}nDriver = {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
  
        "tray" = {
          icon-size = 15;
          spacing = 10;
        };
      };
    };
  };
}


