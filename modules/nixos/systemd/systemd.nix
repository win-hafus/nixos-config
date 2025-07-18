{ config, lib, pkgs, ... }:
{
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.hfv5.uid}";
  };

  systemd = {
    user.services = {
      batteryNotify = {
        description = "Battery percentage notification service for niri";
        wantedBy = [ "default.target" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = pkgs.writeShellScript "batteryNotificationScript" ''
            BATTERY_PATH="/sys/class/power_supply/BAT0"
            CAPACITY=$(cat "$BATTERY_PATH/capacity")
            STATUS=$(cat "$BATTERY_PATH/status")

            if [ "$STATUS" != "Discharging" ]; then
              exit 0
            fi

            FLAG_DIR="$XDG_RUNTIME_DIR/battery_notify_flags"
            mkdir -p "$FLAG_DIR"

            if [ "$CAPACITY" -le 20 ] && [ "$CAPACITY" -gt 10 ]; then
              if [ ! -f "$FLAG_DIR/warned20" ]; then
                notify-send -u low "Battery Low" "Battery at $CAPACITY%. Please plug in your charger."
                touch "$FLAG_DIR/warned20"
                rm -f "$FLAG_DIR/warned10"
              fi
            elif [ "$CAPACITY" -le 10 ]; then
              if [ ! -f "$FLAG_DIR/warned10" ]; then
                notify-send -u critical "Battery Critical" "Battery at $CAPACITY%. Plug in your charger immediately!"
                touch "$FLAG_DIR/warned10"
                rm -f "$FLAG_DIR/warned20"
              fi
            else
              rm -f "$FLAG_DIR/warned20" "$FLAG_DIR/warned10"
            fi
          '';
        };
        enable = true;
      };

      dropbox = {
        description = "Dropbox";
        wantedBy = [ "graphical-session.target" ];
        environment = {
          QT_PLUGIN_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtPluginPrefix;
          QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
        };
        serviceConfig = {
          ExecStart = "${lib.getBin pkgs.dropbox}/bin/dropbox";
          ExecReload = "${lib.getBin pkgs.coreutils}/bin/kill -HUP $MAINPID";
          KillMode = "control-group";
          Restart = "on-failure";
          PrivateTmp = true;
          ProtectSystem = "full";
          Nice = 10;
        };
        enable = true;
      };
    };

    user.timers = {
      batteryNotify = {
        description = "Timer to run batteryNotify every 5 minutes";
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnBootSec = "1min";
          OnUnitActiveSec = "5min";
        };
        enable = true;
      };
    };
  };
}
