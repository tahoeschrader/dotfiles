{ config, lib, pkgs, ... }: {

  imports = [ ./packages.nix ];

  config = {
    home.stateVersion = "23.11";
    home.username = "pooralaska";
    home.homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${config.home.username}"
      else "/home/${config.home.username}";
    programs.home-manager.enable = true;
    nix = {
      package = pkgs.nix; # Not sure why I need to add this
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
      };
    };
  };
}