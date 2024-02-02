# Mac Mini configuration

{ config, pkgs, ... }:

{
  home.username = "pooralaska";
  home.homeDirectory = "/Users/pooralaska";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
