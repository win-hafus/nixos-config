{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zapret-flake.url = "github:aca/zapret-flake.nix";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";

  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          ./hosts/default/configuration.nix

          inputs.catppuccin.nixosModules.catppuccin
          inputs.minegrub-world-sel-theme.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          inputs.zapret-discord-youtube.nixosModules.default

          {
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.hfv5 = {
              imports = [
                ./hosts/default/home.nix
                inputs.catppuccin.homeModules.catppuccin
                inputs.spicetify-nix.homeManagerModules.default
              ];
            };
          }
        ];
      };
    };
}
