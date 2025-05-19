{
  home = {
    language = {
      base = "ja_JP.UTF-8";
    };
    file = {
      ".config/zsh/alexandria-run" = {
        source = ../scripts/alexandria_run.sh;
        executable = true;
      };
    };
    shellAliases = {
      macmini = "home-manager switch --flake ~/Documents/projects/dotfiles#macmini; echo Remember to close and reopen shell!\n";
    };
    sessionPath = [
      "/Library/TeX/texbin"
    ];
  };
  dotfiles.graphical = true;
  dotfiles.projects = true;
}
