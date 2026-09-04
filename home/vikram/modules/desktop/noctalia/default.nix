{
  pkgs,
  inputs,
  config,
  dotfilesRoot,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/hyprland/noctalia/hypr";

  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/hyprland/noctalia/noctalia";

  xdg.dataFile."wallpapers".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/hyprland/noctalia/wallpapers";

  xdg.dataFile."icons/macOS-hypr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/macOS-hypr";

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
