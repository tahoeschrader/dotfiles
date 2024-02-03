# Tmux for fancy panes and stuff in the terminal
{ config, pkgs, lib, ... }: {

  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = '' # put plug-ins here
    '';
  };
}