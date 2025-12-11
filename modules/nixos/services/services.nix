{ pkgs, ... }:
{
  imports = [
    ./ssh.nix
    ./pipewire.nix
    ./openvpn.nix
  ];
  services = {
    flatpak.enable = true;
    libinput.enable = true;
    resolved.enable = true;
    gvfs.enable = true;
    zapret = {
      enable = true;
      params = [
        "--dpi-desync=fake,multidisorder"
        "--dpi-desync-ttl=1"
        "--dpi-desync-autottl=-2"
        "--dpi-desync-split-pos=midsld"
      ];
      blacklist = [
        "www.gosuslugi.ru"
        "chatgpt.com"
        "www.notabenoid.org"
        "gorzdrav.spb.ru"
      ];
     };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-macchiato-lavender";
    };

    power-profiles-daemon = {
      package = pkgs.power-profiles-daemon;
      enable = true;
    };
  };
}
