# Useful terminal utilities and CLIs
{ config, pkgs, ... }: {

  config = {

    home.packages = with pkgs; [
      eza # better ls
      bat # better cat
      k9s # kubernetes cli
      lazygit # fun git UI
      lazydocker # fun docker UI
      nmap # scan network ip addresses
    ];

  };

