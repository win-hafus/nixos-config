{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, catppuccin, home-manager }@inputs:
  {
    nixosConfigurations.hfv5 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
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

