{ config, ... }:
{
  programs.waybar.style = with config.lib.stylix.colors.withHashtag; ''
    
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
      font-family: "Cascadia Code";
      font-size: 13px;
      min-height: 0;
    }

    window#waybar {
      background-color: transparent;
      border: 0;
    }

    #workspaces {
      margin: 5px;
      margin-left: 5px;
    }

    #workspaces button {
      background-color: @base;
      color: @text;
      padding: 0.4rem;
      border-radius: 0;
    }

    #workspaces button:hover, #workspaces button.active {
      background-color: @lavender;
      color: @base;
      border-radius: 0;
    }

    #workspaces button:first-child {
        border-radius: 6px 0 0 6px;
    }

    #workspaces button:last-child {
        border-radius: 0 6px 6px 0;
    }

    #tray,
    #custom-power,
    #clock,
    #battery,
    #pulseaudio,
    #custom-power,
    #network,
    #custom-cpu,
    #custom-warpcheck,
    #language,
    #power-profiles-daemon {
      background-color: @base;
      color: @text;
      padding: 0.4rem 1rem;
      margin: 5px 0;
    }

    #battery {
      padding-left: .5rem; }

    #clock {
      border-radius: 6px 0 0  6px;
    }

    #pulseaudio {
      border-radius: 0 6px 6px 0;
    }

    #network {
      border-radius: 6px 0 0 6px;
      padding-left: 1rem;
    }


    #language {
      border-radius: 6px 0 0 6px;
      padding-left: 1rem;
    }

    #custom-warpcheck {
      border-radius: 0 6px 6px 0;
      padding-right: 1rem;
      margin-right: 1rem;
    }

    #battery.warning:not(.charging) {
      color: @red;
    }

    #custom-power {
        border-radius: 0px 6px 6px 0px;
        margin-right: 1rem;
        padding-left: 0.5rem;
        padding-right: 1.5rem;
    }

    #tray {
      margin-right: 2px;
      border-radius: 6px;
    }

    #custom-cpu {
      margin-right: 1rem;
      border-radius: 6px;
    }
  '';
}
