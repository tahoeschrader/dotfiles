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
      projects = "cd ~/Documents/projects; ls";
      alexandria = "cd ~/Documents/projects/alexandria; zellij -l alexandria";
      backbone = "cd ~/Documents/projects/backbone; dev";
      bunkbed = "cd ~/Documents/projects/bunkbed.tech; dev";
      dotfiles = "cd ~/Documents/projects/dotfiles; dev";
      resume = "cd ~/Documents/projects/resume; dev";
      squadmaker = "cd ~/Documents/projects/squadmaker; dev";
      fushigi = "cd ~/Documents/projects/fushigi-bunpo; dev";
      pysource = "source .venv/bin/activate";
    };
  };
}
