{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    wireplumber = {
      extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
          bluez5.codecs = [
            "sbc"
            "sbc_xq"
            "aac"
          ];
          bluez5.enable-sbc-xq = true;
          bluez5.enable-msbc = true;
          bluez5.enable-hw-volume = true;
          bluez5.roles = [
            "a2dp_sink"
            "a2dp_source"
          ];
        };
      };
      configPackages = [
        (pkgs.writeTextDir "bluetooth-policy" ''
          wireplumber.settings = {
            bluetooth.autoswitch-to-headset-profile = false
          }
        '')
      ];
    };
  };
}