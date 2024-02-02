{ config, lib, pkgs, ... }: {

  imports = [ ./shell ./programming ];

  config.home.stateVersion = "23.11";

  # Not sure why I need to add this (package = pkgs.nix)
  config.nix = {
      package = pkgs.nix;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
  };

  # Define options
  options = {
    # Install packages to /etc/profiles instead of ~/.nix-profile
    home-manager.useUserPackages = true; # doesn't seem to work

    # Not sure what the following are used for
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };
    fullName = lib.mkOption {
      type = lib.types.str;
      description = "Human readable name of the user";
    };
    gitName = lib.mkOption {
      type = lib.types.str;
      description = "Name for tagging git commits";
    };
    gitEmail = lib.mkOption {
      type = lib.types.str;
      description = "Email for tagging git commits";
    };
    dotfilesRepo = lib.mkOption {
      type = lib.types.str;
      description = "Link to dotfiles repository HTTPS URL.";
    };
    hostnames = {
      example = lib.mkOption {
        type = lib.types.str;
        description = "Hostname for example.";
      };
    };
  };
}