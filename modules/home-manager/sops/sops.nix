# ./modules/home-manager/sops/sops.nix
{ config, pkgs, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;
    age.keyFile = "/var/lib/sops-nix/keys.txt";
    
    secrets.wakatime-key = {
      path = "%r/wakatime-key";
    };
  };
}