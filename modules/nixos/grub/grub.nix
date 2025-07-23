{
  config,
  pkgs,
  lib,
  ...
}:
{
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
    gfxmodeEfi = "1920x1080";
    minegrub-world-sel = {
      enable = true;
      customIcons = [
        {
          name = "nixos";
          lineTop = "NixOS";
          lineBottom = "Survival Mode, No Cheats, Version: 25.05";
          imgName = "nixos";
        }
      ];
    };
  };
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
}
