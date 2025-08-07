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
      alexandria = "cd ~/Documents/projects/alexandria; yazi";
      backbone = "cd ~/Documents/projects/backbone; yazi";
      bunkbed = "cd ~/Documents/projects/bunkbed.tech; yazi";
      dotfiles = "cd ~/Documents/projects/dotfiles; yazi";
      resume = "cd ~/Documents/projects/resume; yazi";
      squadmaker = "cd ~/Documents/projects/squadmaker; yazi";
      fushigi = "cd ~/Documents/projects/fushigi-bunpo; yazi";
      pysource = "source .venv/bin/activate";
    };
  };
}
