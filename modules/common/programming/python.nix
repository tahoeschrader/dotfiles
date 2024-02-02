{ config, pkgs, lib, ... }: {
  options.python.enable = lib.mkEnableOption "Python programming language.";
  config = lib.mkIf config.python.enable {
    home.packages = with pkgs; [ python3 ];
  };
}