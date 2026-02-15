{
  imports = [
    ./sops/sops.nix
    ./hyprland/hyprland.nix
    ./packages/packages.nix
    ./programs/programs.nix
    ./services/services.nix
    ./reaper/reaper.nix
    ./themes/themes.nix
    ./xdg/xdg.nix
  ];
}