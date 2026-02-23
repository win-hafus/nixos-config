{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "${./black-variant.png}"
        "${./wanderer.jpg}"
      ];
      wallpaper = [ ",${./black-variant.png}" ];
    };
  };
}
