{
  imports = [
    ./sops/sops.nix
    ./systemd/systemd.nix
    ./services/services.nix
    ./network/network.nix
    ./packages/packages.nix
    ./grub/grub.nix
  ];
}