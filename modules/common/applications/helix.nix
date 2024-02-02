{ config, pkgs, lib, ... }: {
  options.helix.enable = lib.mkEnableOption "Helix code editor.";
  config = lib.mkIf config.helix.enable {
    home.packages = with pkgs; [ helix ];
  };
}