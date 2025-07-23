{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      minegrub-world-sel-theme,
      quickshell,
      catppuccin,
      home-manager,
    }@inputs:
    {
      nixosConfigurations.hfv5 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/default/configuration.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          minegrub-world-sel-theme.nixosModules.default
          {
            home-manager.users.hfv5 = {
              imports = [
                ./hosts/default/home.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
}
