{
  home = {
    file.".config/REAPER/" = {
      source = ./ContextMenuTheme;
    };
    file.".config/REAPER/UserPlugins/" = {
      source = ./SWSPlugin;
    };
    file.".config/REAPER/ColorThemes/" = {
      source = ./ColorThemes;
    };
    file.".config/REAPER/Scripts/" = {
      source = ./SWScripts;
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
