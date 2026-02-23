{
  config,
  pkgs,
  self,
  username,
  ...
}:
{
  sops = {
    defaultSopsFile = "${self}/secrets.yaml";
    validateSopsFiles = false;
    age.keyFile = "/var/lib/sops-nix/keys.txt";
  };
}
