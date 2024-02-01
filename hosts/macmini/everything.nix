# Mac Mini configuration

{ config, pkgs, ... }:

{
  home.username = "pooralaska";
  home.homeDirectory = "/Users/pooralaska";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # Packages directly installed into the default environment
  home.packages = [
    # Programming languages + toolchains
    pkgs.rustup
    pkgs.python3
    
    # Package Managers
    pkgs.bun
    pkgs.fnm
    
    # CLI tools
    pkgs.eza
    pkgs.bat
    pkgs.k9s
  ];
}
