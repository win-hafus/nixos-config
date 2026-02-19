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

    secrets."rsa_key" = {
      path = "/etc/ssh/ssh_host_rsa_key";
      owner = "root";
      mode = "0600";
    };
  };
}
