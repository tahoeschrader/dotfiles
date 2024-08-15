{
  description = "Home Manager configuration of pooralaska";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, alacritty-theme, fenix, ... }@inputs:
    {
      #packages.aarch64-darwin.default = fenix.packages.aarch64-darwin.minimal.toolchain;
      homeConfigurations = {

        # Run with `home-manager switch --flake .#macmini`
        macmini = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            overlays = [ alacritty-theme.overlays.default fenix.overlays.default ];
          };
          modules = [ ./modules ];
        };
      };
    };
}
