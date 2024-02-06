# Useful terminal utilities and CLIs that I'm not doing further cusotmizations on
{ config, pkgs, lib, ... }: {

  options.utilities.enable = lib.mkEnableOption "Extra terminal utilities.";
  config = lib.mkIf config.utilities.enable {

    home.packages = with pkgs; [
      eza # better ls
      bat # better cat
      k9s # kubernetes TUI
      lazygit # fun git TUI
      lazydocker # fun docker TUI
      #gobang # fun sql TUI -- currently broken on the version of rust I have
      nmap # scan network ip addresses
    ];

  };

}