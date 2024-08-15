{ config, lib, pkgs, ... }: {

  imports = [ ./packages.nix ./rust.nix ];

  config = {
    home.stateVersion = "23.11";
    home.username = "pooralaska";
    home.homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${config.home.username}"
      else "/home/${config.home.username}";
    home.file = {
      ".config/zellij/zellij-start" = {
        source = ../scripts/zellij_start.sh;
        executable = true;
      };
      ".config/zsh/alexandria-run" = {
        source = ../scripts/alexandria_run.sh;
        executable = true;
      };
    };
    programs.home-manager.enable = true;
    nix = {
      package = pkgs.nix; # Not sure why I need to add this
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
      };
    };
  };
}
