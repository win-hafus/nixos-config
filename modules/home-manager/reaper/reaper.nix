{
  home = {
    file.".config/REAPER/" = {
      source = ./ContextMenuTheme;
      recursive = true;
    };
    file.".config/REAPER/UserPlugins/" = {
      source = ./SWSPlugin;
      recursive = true;
    };
    file.".config/REAPER/ColorThemes/" = {
      source = ./ColorThemes;
      recursive = true;
    };
    file.".config/REAPER/Scripts/" = {
      source = ./SWScripts;
      recursive = true;
    };
    file.".config/REAPER/Scripts/HeDaScripts/" = {
      source = ./HeDaScripts;
      recursive = true;
    };
    file.".config/REAPER/Data/toolbar_icons/" = {
      source = ./HeDaData/toolbar_icons;
      recursive = true;
    };
  };
}
