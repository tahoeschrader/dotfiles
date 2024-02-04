{ config, pkgs, lib, ... }: {
  options.vim.enable = lib.mkEnableOption "Vim text editor.";
  config = lib.mkIf config.vim.enable {
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
  };
}