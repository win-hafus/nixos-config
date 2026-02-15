# ./modules/home-manager/sops/sops.nix
{ config, pkgs, self, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    validateSopsFiles = false;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    
    secrets.wakatime-key = {};
  };
}