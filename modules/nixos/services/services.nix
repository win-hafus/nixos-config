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
    #resolved.enable = true;
    gvfs.enable = true;
    zapret-discord-youtube = {
      enable = true;
      configName = "general(ALT)";
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
