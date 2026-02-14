{ config, pkgs, self, ... }: {
  sops = {
    defaultSopsFile = "${self}/secrets.yaml"; # Путь к файлу из Шага 3
    validateSopsFiles = false;
    age = {
      sshKeyPaths = [ 
        "/etc/ssh/ssh_host_ed25519_key"
        "/etc/ssh/ssh_host_rsa_key"
      ];
    };
  };
}
