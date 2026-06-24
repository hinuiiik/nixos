{ config,
  pkgs,
  inputs,
  ... }:
let
  dotfiles = "/home/vikram/dotfiles";
in
{
	xdg.configFile."kitty".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/kitty";

  # programs.kitty = {
  #   enable = true;
  # };

  
}
