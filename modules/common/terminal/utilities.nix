# Useful terminal utilities and CLIs
{ config, pkgs, ... }: {

  config = {

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