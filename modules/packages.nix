{pkgs, ...}: {
  imports = [
    {
      nix.settings = {
        extra-substituters = ["https://devenv.cachix.org"];
        extra-trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
      };
      home.packages = [pkgs.devenv];
    }
  ];
  config = {
    fonts.fontconfig.enable = true;
    home = {
      packages = with pkgs; [
        # System, fonts, etc.
        pkg-config
        noto-fonts-cjk-sans
        nerd-fonts.fira-code
        nerd-fonts.hack
        sops
        age
        ssh-to-age
        tree
        devenv

        # Programming languages, etc.
        postgresql
        nodejs_20
        (python3.withPackages (ps: with ps; [pip]))
        jdk
        gradle
        scala
        sbt
        uv
        texlive.combined.scheme-full

        # Misc. TUIs and CLIs
        eza # ls
        bat # cat
        k9s # kubernetes
        lazygit # git
        lazydocker # docker
        nmap # scans network ip addresses
        awscli2 # checking your aws stuff
        yazi # file explorer
        audacity # audio file editor
        ghostscript # pdf compression
        aria2 # download utility
        kubectl
        talosctl
        fluxcd
      ];
      shellAliases = {
        la = "eza -a --icons";
        ll = "eza -lah --icons";
        ls = "eza --color=auto";
        cat = "bat";
      };
      sessionPath = [
        "$HOME/.config/zsh"
        "$HOME/.cargo/bin"
        "$HOME/Library/Application\\ Support/JetBrains/Toolbox/scripts"
      ];
      sessionVariables = {
        VISUAL = "hx";
        PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      };
    };
    programs = {
      git = {
        enable = true;
        userEmail = "tahoeschrader@gmail.com";
        userName = "Tahoe Schrader";
      };
      ssh = {
        enable = true;
        matchBlocks = {
          "github.com" = {
            identityFile = "~/.ssh/id_ed25519";
            extraOptions = { IdentitiesOnly = "yes"; };
          };
          turingpi = {
            user = "tahoe";
            identityFile = "~/.ssh/id_ed25519.tpi2";
            extraOptions = { IdentitiesOnly = "yes"; };
          };
          turingpi-root = {
            hostname = "turingpi";
            user = "root";
            identityFile = "~/.ssh/id_ed25519.tpi2.root";
            extraOptions = { IdentitiesOnly = "yes"; };
          };
          raspberry = {
            user = "raspberrypi";
            identityFile = "~/.ssh/id_ed25519.rpi";
            extraOptions = { IdentitiesOnly = "yes"; };
          };
          raspberrypi-2 = {
            user = "tahoe";
            identityFile = "~/.ssh/id_ed25519.rpi-2";
            extraOptions = { IdentitiesOnly = "yes"; };
          };
          fushigi-vultr = {
            hostname = "167.179.90.92";
            user = "root";
            identityFile = "~/.ssh/id_ed25519.fushigi-vultr";
            extraOptions = { IdentitiesOnly = "yes"; };
          };
          "*".extraOptions.UseKeychain = "yes";
        };
        addKeysToAgent = "yes";
      };
      helix = {
        enable = true;
        defaultEditor = true;
        settings = {
          theme = "base16_transparent";
          editor = {
            file-picker = {
              hidden = false;
            };
            statusline = {
              right = [
                "diagnostics"
                "selections"
                "position"
                "file-encoding"
                "file-line-ending"
                "file-type"
                "total-line-numbers"
              ];
            };
          };
        };
        languages = {
          language = [
            {
              name = "python";
              language-servers = ["pyright"];
            }
          ];
        };
        extraPackages = with pkgs; [
          swift-format
          delve
          texlab
          yaml-language-server
          taplo
          pyright # python lsp
          nil
          metals
          lldb
          marksman
          gopls
          jdt-language-server
          ansible-language-server
          terraform-ls
          nodePackages_latest.bash-language-server
          nodePackages_latest.typescript-language-server
          vscode-langservers-extracted
          dockerfile-language-server-nodejs
          bibtex-tidy
          docker-compose-language-service
        ];
      };
      starship = {
        enable = true;
        settings = {
          battery.disabled = true; # don't use battery since I'm not on laptops
          kubernetes.disabled = false;
        };
      };
      vim = {
        enable = true;
        settings = {ignorecase = true;};
        extraConfig = ''
          set mouse=a
          set nocompatible
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
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
      };
      bun = {
        enable = true;
      };
      go = {
        enable = true;
        goPath = ".go";
      };
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}
