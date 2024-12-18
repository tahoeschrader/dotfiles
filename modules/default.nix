{ config, lib, pkgs, ... }: {

  imports = [ ./packages.nix ./rust.nix ];

  # TODO: make the username and added files dependent on the device
  config = {
    home.stateVersion = "23.11";
    home.username = "pooralaska";
    home.language.base = "ja_JP.UTF-8"; # TODO: is this actually changing anything?
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
      # set package to declaritively set the nix version so I don't need to update all the time
      package = pkgs.nixVersions.latest; 
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
      };
    };
  };
}
