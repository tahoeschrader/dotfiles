{ lib, config, ...}: {
  options.dotfiles = {
    graphical = lib.mkEnableOption "Host has graphical user interface.";
  };
  config = lib.mkIf config.dotfiles.graphical {
    programs = { 
      wezterm = {
        enable = lib.mkDefault true;
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
    };
  };
}
