{
  programs.waybar = {
    enable = true;
    style = ''
      * {
          border-radius: 10px;
          font-family: JetBrainsMono Nerd Font, monospace;
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(29, 32, 48, 0);
          color: #cad3f5;
      }

      #workspaces button {
          padding: 5px;
          color: #1e2030;
          margin-right: 5px;
      }

      #workspaces button.active {
          color: #cad3f5;
      }

      #workspaces button.focused {
          color: #cad3f5;
          background-color: #1e2030;
          border-radius: 10px;
      }

      #workspaces button:hover {
          background-color: #1e2030;
          color: @lavender; 
          border-radius: 10px;
      }

      #window,
      #clock,
      #pulseaudio,
      #network,
      #workspaces,
      #custom-music,
      #custom-power,
      #tray {
          background: #1e2030;
          padding: 0px 10px;
          margin: 3px 0px;
          margin-top: 5px;
          border-radius: 0;
          border: none;
      }

      #tray {
          border-radius: 10px;
          margin-right: 10px;
      }

      #workspaces {
          background: #1e2030;
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;
      }

      #window {
          border-radius: 10px;
          margin-left: 20px;
          margin-right: 20px;
      }

      #custom-music {
          color: #cad3f5;
          border-radius: 10px 10px 10px 10px;
          margin-left: 5px;
      }

      #clock {
          color: #cad3f5;
          border-radius: 10px 10px 10px 10px;
          margin-left: 5px;
      }

      #network {
          color: #cad3f5;
          border-radius: 10px 0px 0px 10px;
      }

      #pulseaudio {
          color: #cad3f5;
          border-left: 0px;
          border-right: 0px;
      }

      #pulseaudio.microphone {
          color: #cad3f5;
          border-radius: 0px 10px 10px 0px;
          border-left: 0px;
          border-right: 0px;
          margin-right: 5px;
      }

      #custom-power {
          color: #cad3f5;
          border-radius: 10px;
          margin-right: 5px;
          border-left: 0;
          border-right: 0;
      }
    '';
  };
}
