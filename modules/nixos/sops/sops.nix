{ config, pkgs, self, ... }: {
  sops = {
    defaultSopsFile = "$${self}/secrets.yaml"; # Путь к файлу из Шага 3
    validateSopsFiles = false;
    age.keyFile = "/var/lib/sops-nix/keys.txt"; # Путь к ПРИВАТНОМУ ключу на сервере
    
    secrets.sing_box_url = { owner = "sing-box"; }; # Объявляем секрет
  };
}