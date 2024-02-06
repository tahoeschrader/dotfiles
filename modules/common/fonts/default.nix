# This succesfully installs fonts... but not to the expected ./config/fontconfig folder
{ config, pkgs, lib, ... }: {
  options.fonts.enable = lib.mkEnableOption "Control of system fonts.";
  config = lib.mkIf config.fonts.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs;[
        noto-fonts-cjk-sans
        (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    ];
  };
}