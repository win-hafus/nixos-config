{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${./wanderer.jpg}" ];
      wallpaper = [ ",${./wanderer.jpg}" ];
    };

  };

}
