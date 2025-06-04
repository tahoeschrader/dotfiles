{
  lib,
  config,
  ...
}: {
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
          config.font = wezterm.font_with_fallback {
            'FiraCode Nerd Font',
            'Hack Nerd Font',
            'Noto Sans CJK JP',
          }
          config.font_size = 15
          config.max_fps = 144;
          config.front_end = 'WebGpu'
          config.cursor_blink_rate = 100
          config.cursor_blink_ease_in = "Constant"
          config.cursor_blink_ease_out = "Constant"
          return config
        '';
      };
    };
  };
}
