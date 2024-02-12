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
  };

  outputs = { nixpkgs, home-manager, alacritty-theme, ... }@inputs:
    {
      homeConfigurations = {
        #nixpkgs.overlays = [ alacritty-theme.overlays.default ]; # doesn't work

        # Run with `home-manager switch --flake .#macmini`
        macmini = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            overlays = [ alacritty-theme.overlays.default ]; # had to put it here
          };
          modules = [ ./modules ];
        };
      };
    };
}
