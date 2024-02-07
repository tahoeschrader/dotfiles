# System configuration for my personal macmini

{ inputs, ... }:

inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = import inputs.nixpkgs {
    system = "aarch64-darwin";
  };
  modules = [
    ../../modules
    {
      home.username = "pooralaska";
      home.homeDirectory = "/Users/pooralaska";
      #programs.example.enable = false;
    }
  ];
}
