{ pkgs, inputs, config, ... }:
let
  dotfiles = "/home/vikram/dotfiles";
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hyprland/noctalia/hypr";

  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hyprland/noctalia/noctalia";

	xdg.dataFile."wallpapers".source =
	    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hyprland/noctalia/wallpapers";

	xdg.dataFile."icons/macOS-hypr".source =
            config.lib.file.mkOutOfStoreSymlink "${dotfiles}/macOS-hypr";

	programs.noctalia = {
	      enable = true;
	      systemd.enable = true;
	      # settings = { # This may also be a string or path to a .toml file.
	      #   launch_apps_as_systemd_services = true;
	      # };
    };
     gtk = {
	    enable = true;
	    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };
}