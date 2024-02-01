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
    pkgs.python3

    # Package Managers
    pkgs.bun
    pkgs.fnm
    
    # CLIS
    pkgs.eza # better ls
    pkgs.bat # better cat
    pkgs.k9s # kubernetes cli
  ];
}
