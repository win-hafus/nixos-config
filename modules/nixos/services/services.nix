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
     zapret = {
      enable = true;
      params = [
        "--dpi-desync=fakedsplit" "--dpi-desync-fooling=badseq" "--dpi-desync-split-pos=1"
        #"--split-pos=host+1 --oob"
      ];
     };

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
