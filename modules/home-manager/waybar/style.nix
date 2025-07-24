{
  programs.waybar = {
  enable = true;
  style = ''
    @define-color rosewater #f4dbd6;
    @define-color flamingo #f0c6c6;
    @define-color pink #f5bde6;
    @define-color mauve #c6a0f6;
    @define-color red #ed8796;
    @define-color maroon #ee99a0;
    @define-color peach #f5a97f;
    @define-color yellow #eed49f;
    @define-color green #a6da95;
    @define-color teal #8bd5ca;
    @define-color sky #91d7e3;
    @define-color sapphire #7dc4e4;
    @define-color blue #8aadf4;
    @define-color lavender #b7bdf8;
    @define-color text #cad3f5;
    @define-color subtext1 #b8c0e0;
    @define-color subtext0 #a5adcb;
    @define-color overlay2 #939ab7;
    @define-color overlay1 #8087a2;
    @define-color overlay0 #6e738d;
    @define-color surface2 #5b6078;
    @define-color surface1 #494d64;
    @define-color surface0 #363a4f;
    @define-color base #24273a;
    @define-color mantle #1e2030;
    @define-color crust #181926;

    * {
      font-family: Cascadia Code;
      font-size: 17px;
      min-height: 0;
    }

    window#waybar {
      background: @mantle;
      color: @text;
    }

    #workspaces {
      border-radius: 8px;
      margin: 5px;
      margin-left: 10px;
      background-color: @surface0;
      padding: 0.1rem 0.4rem;
    }

    #workspaces button {
      color: @surface1;
      border-radius: 8px;
      padding: 0.1rem 0.4rem;
    }

    #workspaces button.active {
      color: @sky;
      border-radius: 8px;
    }

    #workspaces button:hover {
      color: @sapphire;
      border-radius: 8px;
    }

    #custom-music,
    #tray,
    #backlight,
    #clock,
    #battery,
    #pulseaudio,
    #custom-lock,
    #custom-power {
      background-color: @surface0;
      padding: 0.1rem 1rem;
      margin: 5px 0;
    }

    #clock {
      color: @blue;
      border-radius: 0px 8px 8px 0px;
      margin-right: 1rem;
    }

    #battery {
      color: @green;
    }

    #battery.charging {
      color: @green;
    }

    #battery.warning:not(.charging) {
      color: @red;
    }

    #backlight {
      color: @yellow;
    }

    #backlight, #battery {
        border-radius: 0;
    }

    #pulseaudio {
      color: @maroon;
      border-radius: 8px 0px 0px 8px;
      margin-left: 1rem;
    }

    #custom-music {
      color: @mauve;
      border-radius: 8px;
    }

    #custom-lock {
        border-radius: 8px 0px 0px 8px;
        color: @lavender;
    }

    #custom-power {
        margin-right: 10px;
        border-radius: 0px 8px 8px 0px;
        color: @red;
    }

    #tray {
      margin-right: 1rem;
      border-radius: 8px;
    }
    '';
  };
}
