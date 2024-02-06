# File explorer
{ config, pkgs, lib, ... }: {

  options.nnn.enable = lib.mkEnableOption "N Cubed File Explorer TUI.";
  config = lib.mkIf config.nnn.enable {
    programs.nnn = {
      enable = true;
      package = pkgs.nnn.override { withNerdIcons = true; };
      plugins = {};
    };
  };
}