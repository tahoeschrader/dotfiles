# Useful terminal utilities and CLIs
{ config, pkgs, ... }: {

  config = {

    home.packages = with pkgs; [
      eza # better ls
      bat # better cat
      k9s # kubernetes cli
    ];

  };

}