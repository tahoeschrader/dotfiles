{ config, pkgs, lib, ... }: {
  options.rust.enable = lib.mkEnableOption "Rust programming language.";
  config = lib.mkIf config.rust.enable {
    home.packages = with pkgs; [ rustup ];
  };
}