{
  nixConfig = {
    extra-substituters = [
      "https://nixos-config-cache-hfv5.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-config-cache-hfv5.cachix.org-1:h8ptySxiX2eztliDPG0Y6PadJM0fAPDY27RQ1rfWRbA="
    ];
  };
  
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

    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    sops-nix.url = "github:Mic92/sops-nix";

  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      username = "hfv5";
      hostname = "nixos";
    in
    {
      lib = {
        inherit username hostname;
      };

      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            self
            username
            hostname
            ;
        };

        modules = [
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.catppuccin.nixosModules.catppuccin

          inputs.minegrub-world-sel-theme.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
          inputs.zapret-discord-youtube.nixosModules.default
          inputs.sops-nix.nixosModules.sops

          {
            home-manager.extraSpecialArgs = { inherit inputs username hostname; };
            home-manager.users.${username} = {
              imports = [
                ./hosts/default/home.nix
                inputs.catppuccin.homeModules.catppuccin
                inputs.spicetify-nix.homeManagerModules.default
                inputs.sops-nix.homeManagerModules.sops
              ];
            };
          }
        ];
      };
    };
}
