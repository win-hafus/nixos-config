{ builtins }:
{
  programs.ranger.plugins = {
    name = "devicons";
    src = builtins.fetchGit {
      url = "https://github.com/alexanderjeurissen/ranger_devicons";
    };
  };
}
