{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      minegrub-world-sel-theme,
      catppuccin,
      zen-browser,
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
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
