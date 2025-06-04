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
      alexandria = "cd ~/Documents/projects/alexandria; exec zellij -l alexandria";
      backbone = "cd ~/Documents/projects/backbone; exec zellij -l dev";
      bunkbed = "cd ~/Documents/projects/bunkbed.tech; exec zellij -l dev";
      dotfiles = "cd ~/Documents/projects/dotfiles; exec zellij -l dev";
      resume = "cd ~/Documents/projects/resume; exec zellij -l dev";
      squadmaker = "cd ~/Documents/projects/squadmaker; exec zellij -l dev";
      fushigi = "cd ~/Documents/projects/fushigi-bunpo; exec zellij -l dev";
      pysource = "source .venv/bin/activate";
    };
  };
}
