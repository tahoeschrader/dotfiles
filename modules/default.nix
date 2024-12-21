{ config, lib, pkgs, ... }: {
  imports = [ ./graphical.nix ./packages.nix ./rust.nix ];
  home.stateVersion = "23.11";
  home.username = lib.mkDefault "pooralaska";
  home.homeDirectory =
    if pkgs.stdenv.isDarwin
    then "/Users/${config.home.username}"
    else
      if pkgs.stdenv.isWindows
      then "C:\\Users\\${config.home.username}"
      else "/home/${config.home.username}";
  programs.home-manager.enable = true;
  nix = {
    # set package to declaritively set the nix version so I don't need to update all the time
    package = pkgs.nixVersions.latest; 
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
 }
