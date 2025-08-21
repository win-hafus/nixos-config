{
  xdg.desktopEntries = {
    rofi = {
      type="Application";
      name="Rofi";
      exec="rofi -show";
      terminal=false;
      noDisplay=true;
    };
    rofi-theme-selector = {
      type="Application";
      name="Rofi Theme Selector";
      exec="rofi-theme-selector";
      terminal=false;
      noDisplay=true;
    };
    Helix = {
      type="Application";
      name="Helix";
      exec="hx %F";
      terminal=true;
      noDisplay=true;
    };
    mpv = {
      type="Application";
      name="mpv Media Player";
      exec="mpv --player-operation-mode=pseudo-gui -- %U";
      terminal=false;
      noDisplay=true;
    };
    htop = {
      type="Application";
      name="Htop";
      exec="htop";
      terminal=true;
      noDisplay=true;
    };
  };
}
