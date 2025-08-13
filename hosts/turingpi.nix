{
  pkgs,
  ...
}: {
  home.username = "tahoe";
  home.homeDirectory = "/home/tahoe";
  programs.wezterm.enable = false;
  nix.package = pkgs.nixVersions.latest;
}
