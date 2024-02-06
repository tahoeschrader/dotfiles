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
    {
      home.username = "pooralaska";
      home.homeDirectory = "/Users/pooralaska";
      rust.enable = true;
      javascript.enable = true;
      python.enable = true;
      helix.enable = true;
      vscode.enable = true;
      vim.enable = true;
      zsh.enable = true;
      nnn.enable = true;
      tmux.enable = true;
      starship.enable = true;
      utilities.enable = true;
    }
  ];
}
