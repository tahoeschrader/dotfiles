# Starship for terminal decoration
{ config, pkgs, lib, ... }: {

  programs.starship = {
    enable = true;
    settings = {
      battery.disabled = true; # Don't use battery since I'm not on laptops
    };
  };

}