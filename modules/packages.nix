{ pkgs, lib, ... }: {
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  programs.alacritty = {
    enable = true;
    settings = {
      import = [ pkgs.alacritty-theme.gruvbox_material ];
      mouse = { hide_when_typing = true; };

      font = let fontname = "FiraCode Nerd Font"; in
        {
          normal = { family = fontname; style = "Bold"; };
          bold = { family = fontname; style = "ExtraBold"; };
          italic = { family = fontname; style = "ExtraLight"; };
          size = 15;
        };
      window = {
        # Need to figure out a better way for dimensions and placement of apps
        dimensions = {columns = 230; lines = 64; };
      };
      cursor = {
        style = {shape = "Beam"; };
      };
    };
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
    dotDir = ".config/zsh";
    history.path = "$ZDOTDIR/.zsh_history";
    shellAliases = {
      la = "eza -a --icons";
      ll = "eza -lah --icons";
      ls = "eza --color=auto";
      cat = "bat";
      macmini = "home-manager switch --flake ~/projects/dotfiles#macmini; exec zsh";
      notes = "cd ~/Library/Mobile\\ Documents/iCloud\\~md\\~obsidian/Documents/Personal; ls";
      projects = "cd ~/projects; ls";
      rustdev = "zellij -l rust-dev";
      dev = "zellij -l dev";
      alexandria = "cd ~/projects/alexandria; zellij-start alexandria alexandria";
      backbone = "cd ~/projects/backbone; zellij-start backbone dev";
      bunkbed = "cd ~/projects/bunkbed.tech; zellij-start bunkbed dev";
      calligraful = "cd ~/projects/calligraful; zellij-start calligraful dev";
      dotfiles = "cd ~/projects/dotfiles; zellij-start dotfiles dev";
      immerser = "cd ~/projects/immerser; zellij-start immerser dev";
      practice = "cd ~/projects/practice; zellij-start practice dev";
      resume = "cd ~/projects/resume; zellij-start resume dev";
      squadmaker = "cd ~/projects/squadmaker; zellij-start squadmaker dev";
    };
    initExtra = lib.mkIf pkgs.stdenv.isDarwin ''
      # Added by Toolbox App
      export PATH="$PATH:/Users/pooralaska/Library/Application Support/JetBrains/Toolbox/scripts"
      export PATH="$PATH:$HOME/.config/zellij"
      export PATH="$PATH:$HOME/.config/zsh"
      export EDITOR="/Users/pooralaska/.nix-profile/bin/hx"
      export VISUAL="/Users/pooralaska/.nix-profile/bin/hx"
      export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig
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
  
  fonts.fontconfig.enable = true;
  home.packages = with pkgs;[
    pkg-config
  
    # Applications (might want to lock these behind options)
    spotify
    qbittorrent
    iina
    discord
    audacity

    # Applications (currently marked as broken)
    # calibre
    # rpi-imager
    # anki
    
    # Font stuff
    noto-fonts-cjk-sans
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    
    # Programming languages, etc.
    nodejs_20
    bun # alternative javascript runtime written in rust
    (python3.withPackages (ps: with ps; [pip]))
    go
    
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
