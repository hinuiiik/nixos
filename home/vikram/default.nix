{
  lib,
  inputs,
  desktopProfile ? "noctalia",
  ...
}:
let
  homeDir = "/home/vikram";
  # repoRoot = 
  #   if builtins.pathExists ./.useHome
  #   then "${homeDir}/nixos" 
  #   else "/etc/nixos";
  useHOME = true;
  repoRoot = 
      if useHOME
      then "${homeDir}/nixos" 
      else "/etc/nixos";
  dotfilesRoot = "${repoRoot}/home/vikram/dotfiles";
  desktopModule = if desktopProfile == "persona" then ./modules/desktop/persona else ./modules/desktop/noctalia;
in
{
  _module.args = {
    inherit dotfilesRoot;
  };

  imports = [
    ./modules/packages/fish.nix
    ./modules/packages/kitty.nix
    ./modules/desktop/common.nix
    ./modules/packages/core.nix
    ./modules/packages/qt.nix
    ./modules/packages/media.nix
    ./modules/packages/work.nix
    ./modules/packages/steam-run.nix
    desktopModule
  ];
  home.username = "vikram";
  home.homeDirectory = "/home/vikram";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
