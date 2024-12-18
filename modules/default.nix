{ config, lib, pkgs, ... }: {

  imports = [ ./packages.nix ./rust.nix ];

  config = {
    home.stateVersion = "23.11";
    home.username = "pooralaska";
    home.language.base = "ja_JP.UTF-8";
    home.homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${config.home.username}"
      else "/home/${config.home.username}";
    home.file = {
      ".config/zsh/alexandria-run" = {
        source = ../scripts/alexandria_run.sh;
        executable = true;
      };
    };
    programs.home-manager.enable = true;
    nix = {
      package = pkgs.nixVersions.latest; # declaritively set nix version so I don't need to update all the time
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
      };
    };
  };
}
