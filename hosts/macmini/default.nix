# Mac Mini configuration

{ config, pkgs, ... }:

{
  home.username = "pooralaska";
  home.homeDirectory = "/Users/pooralaska";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # Packages directly installed into the default environment
  home.packages = [
    # Programming languages + toolchains
    pkgs.rustup
    pkgs.python3
    
    # Package Managers
    pkgs.bun
    pkgs.fnm
    
    # CLI tools
    pkgs.eza
    pkgs.bat
    pkgs.k9s
  ];

  # Zsh as my shell instead of bash
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history.path = ".config/zsh/.zsh_history";
    shellAliases = {
      la = "eza -a --icons";
      ll = "eza -lah --icons";
      ls = "eza --color=auto";
      cat = "bat --style=plain";
    };
    initExtra = ''
      # Added by Toolbox App
      export PATH="$PATH:/Users/pooralaska/Library/Application Support/JetBrains/Toolbox/scripts"
      eval "$(/opt/homebrew/bin/brew shellenv)"
      '';
      
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        # will source zsh-syntax-highlighting.plugin.zsh
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "v0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
      }
    ];
  };

  # Starship for terminal decoration
  programs.starship = {
    enable = true;
    settings = {
      # Disable the battery check since I'm not on a laptop
      battery.disabled = true;
    };
  };
}
