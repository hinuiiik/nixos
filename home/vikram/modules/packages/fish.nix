{ config,
  pkgs,
  inputs,
  dotfilesRoot,
  ... }:
{
  # programs.fish.enable = true;
  xdg.configFile."fish".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/fish";
}
