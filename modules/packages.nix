{ pkgs, lib, config,  ... }: {
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  programs.wezterm = {
    enable = true;
  };
  
  programs.helix = {
    enable = true;
    languages = {
      language = [
        # Change default language server for python
        {
          name = "python";
          language-servers = ["pyright"];
        }
      ];
    };
  };
  
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
    plugins = {};
  };
  
  programs.starship = {
    enable = true;
    settings = {
      battery.disabled = true; # Don't use battery since I'm not on laptops
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox";
      # can layout be moved to a different folder?
      layout_dir = "${./layouts}";
      window.option_as_alt = "Both";
    };
  };
  
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
      set nocompatible
      set mouse=a
      syntax on
      set number
      set laststatus=2
      set encoding=utf-8
      set autoindent expandtab smarttab tabstop=2 shiftwidth=2 softtabstop=-1
      set cursorline
      autocmd InsertEnter * set nocursorline
      autocmd InsertLeave * set cursorline
    '';
  };
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "eza -a --icons";
      ll = "eza -lah --icons";
      ls = "eza --color=auto";
      cat = "bat";
      macmini = "home-manager switch --flake ~/projects/dotfiles#macmini; exec zsh";
      notes = "cd ~/Library/Mobile\\ Documents/iCloud\\~md\\~obsidian/Documents/Personal; ls";
      projects = "cd ~/projects; ls";
      dev = "zellij -l dev";
      alexandria = "cd ~/projects/alexandria; zellij -l alexandria";
      backbone = "cd ~/projects/backbone; dev";
      bunkbed = "cd ~/projects/bunkbed.tech; dev";
      dotfiles = "cd ~/projects/dotfiles; dev";
      practice = "cd ~/projects/practice; dev";
      resume = "cd ~/projects/resume; dev";
      squadmaker = "cd ~/projects/squadmaker; dev";
    };
    initExtra = lib.mkIf pkgs.stdenv.isDarwin ''
      export PATH="$PATH:$HOME/.config/zellij"
      export PATH="$PATH:$HOME/.config/zsh"
      export EDITOR="/Users/pooralaska/.nix-profile/bin/hx"
      export VISUAL="/Users/pooralaska/.nix-profile/bin/hx"
      export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig
      export PATH="/Library/TeX/texbin:$PATH"
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

  programs.bun.enable = true;
  programs.go = {
    enable = true;
    goPath = ".go";
  };
  
  fonts.fontconfig.enable = true;
  home.packages = with pkgs;[
    pkg-config
  
    # Applications (might want to lock these behind options)
    spotify
    audacity
  
    # Font stuff
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
    nerd-fonts.hack
    
    # Programming languages, etc.
    nodejs_20
    (python3.withPackages (ps: with ps; [pip]))
    
    # Language servers - TODO: make dependent on helix enabale
    llvmPackages.lldb
    delve
    texlab
    yaml-language-server
    taplo
    pyright # python lsp
    nil
    marksman
    gopls
    ansible-language-server
    terraform-ls
    nodePackages_latest.bash-language-server
    nodePackages_latest.typescript-language-server
    vscode-langservers-extracted
    dockerfile-language-server-nodejs
    
    # Misc. TUIs and CLIs
    eza # ls
    bat # cat
    k9s # kubernetes
    lazygit # git
    lazydocker # docker
    nmap # scans network ip addresses
    ncspot # spotify
    unrar
    awscli2
  ];

}
