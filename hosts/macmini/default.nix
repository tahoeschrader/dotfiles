# System configuration for my personal macmini

{ inputs, globals, ... }:

inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = import inputs.nixpkgs {
    system = "aarch64-darwin";
  };
  modules = [
    globals
    ../../modules/common
    ../../modules/darwin
    ../macmini/everything.nix
    {
      rust.enable = true;
    }
  ];
}
