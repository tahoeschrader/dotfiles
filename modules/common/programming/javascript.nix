{ config, pkgs, lib, ... }: {
  options.javascript.enable = lib.mkEnableOption "Javascript runtimes and frameworks.";
  config = lib.mkIf config.javascript.enable {
    home.packages = with pkgs; [
      fnm # version manager for the node.js runtime
      bun # alternative javascript runtime written in rust
    ];
  };
}