{ config, pkgs, lib, ...}: {
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
    gfxmodeEfi = "1920x1080";
    minegrub-world-sel = {
      enable = true;
      customIcons = [{
        name = "nixos";
        lineTop = "NixOS (some date)";
        lineBottom = "Survival Mode, No Cheats, Version: 23.11";
        imgName = "nixos";
      }];
    };
  };
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
}
