{
  description = "Home Manager configuration of pooralaska";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, fenix, ... }@inputs:
    {          
       homeConfigurations = {

        # Run with `home-manager switch --flake .#macmini`
        macmini = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            overlays = [ fenix.overlays.default ];
          };
          modules = [ ./modules ];
        };

        # TODO: add turing pi machines
      };
    };
}
