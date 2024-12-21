{pkgs, ...}: {
  # TODO: fix any device hardcoded information to be more modular, zsh for example
  config = {
    fonts.fontconfig.enable = true;
    home = {
      packages = with pkgs; [
        # System, fonts, etc.
        pkg-config
        noto-fonts-cjk-sans
        nerd-fonts.fira-code
        nerd-fonts.hack

        # Programming languages, etc.
        postgresql
        nodejs_20
        (python3.withPackages (ps: with ps; [pip]))

        # Misc. TUIs and CLIs
        eza # ls
        bat # cat
        k9s # kubernetes
        lazygit # git
        lazydocker # docker
        nmap # scans network ip addresses
        awscli2
      ];
      shellAliases = {
        la = "eza -a --icons";
        ll = "eza -lah --icons";
        ls = "eza --color=auto";
        cat = "bat";
        dev = "zellij -l dev";
      };
      sessionPath = [
        "$HOME/.config/zellij"
        "$HOME/.config/zsh"
        "$HOME/.cargo/bin"
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
      helix = {
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
        extraPackages = with pkgs; [
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
        ];
      };
      nnn = {
        enable = true;
        package = pkgs.nnn.override {withNerdIcons = true;};
        plugins = {};
      };
      starship = {
        enable = true;
        settings = {
          battery.disabled = true; # don't use battery since I'm not on laptops
        };
      };
      zellij = {
        enable = true;
        settings = {
          theme = "gruvbox";
          layout_dir = "${./layouts}";
          window.option_as_alt = "Both";
        };
      };
      vim = {
        enable = true;
        settings = {ignorecase = true;};
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
      zsh = {
        enable = true;
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
      bun = {
        enable = true;
      };
      go = {
        enable = true;
        goPath = ".go";
      };
    };
  };
}
