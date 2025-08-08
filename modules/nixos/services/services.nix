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
    logmein-hamachi.enable = true;
    blueman.enable = true;
    resolved.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "catppuccin-macchiato";
      extraPackages = [
        (pkgs.catppuccin-sddm.override {
          flavor = "macchiato";
          font = "Casacdia Code";
          fontSize = "11";
        })
      ];
    };

    power-profiles-daemon = {
      package = pkgs.power-profiles-daemon;
      enable = true;
    };
  };
}
