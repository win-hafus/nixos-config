{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${builtins.toString ./wanderer.jpg}" ];
      wallpaper = [ ",${builtins.toString ./wanderer.jpg}" ];
    };
    
  };
  
}
