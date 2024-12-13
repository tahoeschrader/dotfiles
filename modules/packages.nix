{ pkgs, lib,  ... }: {
  # TODO: put modules behind on/off flags based on device being used

  programs.git = {
    enable = true;
    userEmail = "tahoeschrader@gmail.com";
    userName = "Tahoe Schrader";  
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/id_ed25519";
          
      };
      turingpi = {
        user = "tahoe";
        identityFile = "~/.ssh/id_ed25519.tpi2";  
      };
      turingpi-root = {
        hostname = "turingpi";
        user = "root";
        identityFile = "~/.ssh/id_ed25519.tpi2.root";  
      };
      raspberry = {
        user = "raspberrypi";
        identityFile = "~/.ssh/id_ed25519.rpi";  
      };
      raspberrypi-2 = {
        user = "tahoe";
        identityFile = "~/.ssh/id_ed25519.rpi-2";  
      };
      "*".extraOptions.UseKeychain = "yes";
    };
    addKeysToAgent = "yes";
  };
  
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = {}
      config.color_scheme = 'Gruvbox Dark (Gogh)'
      config.font = wezterm.font 'FiraCode Nerd Font'
      config.font = wezterm.font_with_fallback {
        'Hack Nerd Font',
        'Noto Sans CJK JP',
      }
      config.font_size = 15.0
      config.max_fps = 144;
      config.front_end = 'WebGpu'

      return config
    '';
  };
  
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
    };
    languages = {
      language = [
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
      battery.disabled = true; # don't use battery since I'm not on laptops
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox";
      # TODO: can/should the layouts be moved to the parent folder?
      layout_dir = "${./layouts}";
      window.option_as_alt = "Both";
    };
  };
  
  programs.vim = {
    enable = true;
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

  # TODO: Make zsh more modular for other usernames or non apple devices
  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "eza -a --icons";
      ll = "eza -lah --icons";
      ls = "eza --color=auto";
      cat = "bat";
      macmini = "home-manager switch --flake ~/projects/dotfiles#macmini; echo Remember to close and reopen shell!\n";
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
    # TODO: Remember what this is
    pkg-config
  
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
    awscli2
  ];

}
