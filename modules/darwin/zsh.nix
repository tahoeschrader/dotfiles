# Slight changes made to zsh for MacOS
{ pkgs, ... }: {

  config = {

    programs.zsh.initExtra = ''
      # Added by Toolbox App
      export PATH="$PATH:/Users/pooralaska/Library/Application Support/JetBrains/Toolbox/scripts"
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';

  };

}