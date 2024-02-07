{ config, lib, pkgs, ... }: {

  imports = [ ./packages.nix ];

  config = {
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;
    nix = {
      package = pkgs.nix; # Not sure why I need to add this
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };
  };
}