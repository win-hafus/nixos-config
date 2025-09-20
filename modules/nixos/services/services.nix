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

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "catppuccin-macchiato-lavender";
    };

    power-profiles-daemon = {
      package = pkgs.power-profiles-daemon;
      enable = true;
    };
  };
}
