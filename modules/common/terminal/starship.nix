# Starship for terminal decoration
{ config, pkgs, lib, ... }: {

  options.starship.enable = lib.mkEnableOption "Starship terminal decorator.";
  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        battery.disabled = true; # Don't use battery since I'm not on laptops
      };
    };
  };
}