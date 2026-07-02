{ config,
  pkgs,
  inputs,
  dotfilesRoot,
  ... }:
{
	xdg.configFile."kitty".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/kitty";

  # programs.kitty = {
  #   enable = true;
  # };

  
}
