# File explorer
{ config, pkgs, lib, ... }: {

  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
    plugins = {};
  };
}