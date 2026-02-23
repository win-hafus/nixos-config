{
  programs.ranger.plugins = {
    name = "devicons";
    src = fetchGit {
      url = "https://github.com/alexanderjeurissen/ranger_devicons";
    };
  };
}
