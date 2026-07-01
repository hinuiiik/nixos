{ config,
  pkgs,
  inputs,
  ... }:
let
  dotfiles = "/home/vikram/dotfiles";
in
{
  # programs.fish.enable = true;
  xdg.configFile."fish".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fish";
}
