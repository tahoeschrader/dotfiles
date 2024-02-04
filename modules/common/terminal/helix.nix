{ config, pkgs, lib, ... }: {
  options.helix.enable = lib.mkEnableOption "Helix code editor.";
  config = lib.mkIf config.helix.enable {
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

    # Add language servers/debuggers
    home.packages = with pkgs; [
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
    ];
  };
}