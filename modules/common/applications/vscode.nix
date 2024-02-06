{ config, pkgs, lib, ... }: {
  options.vscode.enable = lib.mkEnableOption "Visual studio code editor.";
  config = lib.mkIf config.vscode.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "vscode"
    ];
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        #vadimcn.vscode-lldb # tons of build errors -- need for debugging rust and other languages
        #ms-python.vscode-pylance # can't run due to Unfree -- do I need this if I have pyright globally installed?
        #luquedaniel.renpy-language # doesn't exist -- needed for Ren'Py Visual Novel engine
        #platformio.platformio-ide # doesn't exist -- useful for embedded/arduino programming
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        ms-python.python
        james-yu.latex-workshop
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-azuretools.vscode-docker
        redhat.vscode-yaml
        bierner.markdown-mermaid
        yzhang.markdown-all-in-one
        golang.go
        bbenoist.nix
      ];
      userSettings = {
        "files.autoSave" = "off";
        "[nix]"."editor.tabSize" = 2;
        "terminal.integrated.fontFamily" = "'FiraCode Nerd Font Mono'";
      };
    };
  };
}