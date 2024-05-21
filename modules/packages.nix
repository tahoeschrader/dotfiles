{ pkgs, lib, ... }: {
  # Unfree packages I still want to use nix for
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

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
  
  programs.tmux = {
    # thinking of doing zellij instead
    enable = true;
    extraConfig = '' # put plug-ins here
    '';
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
      macmini = "home-manager switch --flake ~/projects/dotfiles#macmini";
      notes = "cd ~/Library/Mobile\\ Documents/iCloud\\~md\\~obsidian/Documents/Personal; ls";
      projects = "cd ~/projects; ls";
    };
    initExtra = lib.mkIf pkgs.stdenv.isDarwin ''
      # Added by Toolbox App
      export PATH="$PATH:/Users/pooralaska/Library/Application Support/JetBrains/Toolbox/scripts"
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
    # Applications (might want to lock these behind options)
    spotify
    
    # Font stuff
    noto-fonts-cjk-sans
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    
    # Programming languages, etc.
    fnm # version manager for the node.js runtime
    bun # alternative javascript runtime written in rust
    (python3.withPackages (ps: with ps; [pip]))
    rustup
    go
    
    # Language servers - TODO: make dependent on helix enabale
    llvmPackages.lldb # debugger
    texlab # latex and bibtex lsp
    yaml-language-server
    taplo # toml lsp
    pyright # python lsp
    nil # nix lsp
    marksman # markdown lsp
    gopls # go lsp
    ansible-language-server
    terraform-ls
    nodePackages.bash-language-server
    vscode-langservers-extracted
    dockerfile-language-server-nodejs
    
    # Misc. TUIs
    eza # ls
    bat # cat
    k9s # kubernetes
    lazygit # git
    lazydocker # docker
    nmap # scans network ip addresses
    ncspot # spotify
  ];

}
