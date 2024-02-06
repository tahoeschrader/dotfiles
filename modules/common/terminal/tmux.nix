# Tmux for fancy panes and stuff in the terminal
{ config, pkgs, lib, ... }: {

  options.tmux.enable = lib.mkEnableOption "Tmux Terminal Multiplexer.";
  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      extraConfig = '' # put plug-ins here
      '';
    };
  };
}