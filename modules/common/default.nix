{ config, lib, pkgs, ... }: {

  imports = [ ./shell ./programming ];

  config.home.stateVersion = "23.11";
  config.nix = {
      # Not sure why I need to add this,
      # but it lets me write extraOptions
      package = pkgs.nix;

      # Enable features in Nix commands
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
  };
  options = {
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