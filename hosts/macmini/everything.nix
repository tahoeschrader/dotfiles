# Mac Mini configuration

{ config, pkgs, ... }:

{
  home.username = "pooralaska";
  home.homeDirectory = "/Users/pooralaska";
  programs.home-manager.enable = true;

}
