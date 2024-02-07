{
  description = "Home Manager configuration of pooralaska";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:

  # Basic configuration: home-manager switch --flake .#macmini
  {
    homeConfigurations = {
      macmini = import ./hosts/macmini { inherit inputs; };
    };
  };
}
