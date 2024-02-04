{ config, pkgs, lib, ... }: {
  options.vscode.enable = lib.mkEnableOption "Visual studio code editor.";
  config = lib.mkIf config.vscode.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "vscode"
    ];
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        #vadimcn.vscode-lldb
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        #platformio
      ];
    };
  };
}