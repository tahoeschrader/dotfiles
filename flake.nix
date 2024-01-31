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

  outputs = { nixpkgs, home-manager, ... }:
    let
      # Global configuration for my systems
      globals = let baseName = "tahoes.dev";
      in rec {
        user = "pooralaska";
        fullName = "Tahoe Schrader";
        gitName = fullName;
        gitEmail = "tahoeschrader@gmail.com";
        dotfilesRepo = "https://github.com/tahoeschrader/dotfiles";
        hostnames = {
          # Future Subdomains
          # example = "example.${baseName}";
        };
      };
    in {
    # Basic configuration: home-manager switch --flake flake.nix
      homeConfigurations."pooralaska" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
        };
        modules = [ ./hosts/macmini ];
      };
    };
}
