{ config, pkgs, lib, ... }: {
  options.alacritty.enable = lib.mkEnableOption "Alacritty lightweight terminal.";
  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {

        mouse = { hide_when_typing = true; };

        font = let fontname = "FiraCode Nerd Font"; in
          {
            normal = { family = fontname; style = "Bold"; };
            bold = { family = fontname; style = "ExtraBold"; };
            italic = { family = fontname; style = "ExtraLight"; };
            size = 15;
          };
      };
    };
  };
}