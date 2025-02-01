{
  lib,
  config,
  ...
}: {
  options.dotfiles = {
    projects = lib.mkEnableOption "Host is working on personal coding projects.";
  };
  config = lib.mkIf config.dotfiles.projects {
    home.shellAliases = {
      projects = "cd ~/projects; ls";
      alexandria = "cd ~/projects/alexandria; zellij -l alexandria";
      backbone = "cd ~/projects/backbone; dev";
      bunkbed = "cd ~/projects/bunkbed.tech; dev";
      dotfiles = "cd ~/projects/dotfiles; dev";
      resume = "cd ~/projects/resume; dev";
      squadmaker = "cd ~/projects/squadmaker; dev";
      fushigi = "cd ~/projects/fushigi-bunpo; dev";
    };
  };
}
