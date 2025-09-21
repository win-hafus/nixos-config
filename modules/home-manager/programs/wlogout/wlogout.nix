{
  programs.wlogout = {
    enable = true;
    style = ''
        * {
        	background-image: none;
        	box-shadow: none;
        }

        window {
        	background-color: rgba(36, 39, 58, 0.50);
        }

        button {
        	border-radius: 0;
        	border-color: #b7bdf8;
        	text-decoration-color: #cad3f5;
        	color: #cad3f5;
        	background-color: #1e2030;
        	border-style: solid;
        	border-width: 1px;
        	background-repeat: no-repeat;
        	background-position: center;
        	background-size: 25%;
        }

        button:focus, button:active, button:hover {
        	background-color: rgb(53, 57, 75);
        	outline-style: none;
        }


        #lock {
            background-image: url("${./icons/lock.svg}");
            border-radius: 8px 0 0 0;
        }

        #hibernate {
            background-image: url("${./icons/hibernate.svg}");
            border-radius: 0 0 0 8px;
        }

        #logout {
            background-image: url("${./icons/logout.svg}");
        }

        #shutdown {
            background-image: url("${./icons/shutdown.svg}");
        }

        #suspend {
            background-image: url("${./icons/suspend.svg}");
            border-radius: 0 8px 0 0;
        }

        #reboot {
            background-image: url("${./icons/reboot.svg}");
            border-radius: 0 0 8px 0;
        }
      '';
   layout = [
        {
            "label" = "lock";
            "action" = "hyprlock";
            "text" = "Lock";
            "keybind" = "l";
        }
        {
            "label" = "suspend";
            "action" = "systemctl suspend-then-hibernate";
            "text" = "Suspend";
            "keybind" = "u";
        }
        {
            "label" = "logout";
            "action" = "hyprctl dispatch exit";
            "text" = "Logout";
            "keybind" = "e";
        }
        {
            "label" = "shutdown";
            "action" = "systemctl poweroff";
            "text" = "Shutdown";
            "keybind" = "s";
        }
        {
            "label" = "hibernate";
            "action" = "systemctl hibernate";
            "text" = "Hibernate";
            "keybind" = "h";
        }
        {
            "label" = "reboot";
            "action" = "systemctl reboot";
            "text" = "Reboot";
            "keybind" = "r";
        }
    ];
  };  
}
