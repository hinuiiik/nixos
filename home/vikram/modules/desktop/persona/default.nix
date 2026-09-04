{
  pkgs,
  inputs,
  config,
  dotfilesRoot,
  ...
}:
{
  home.packages = [
    (import ./quickshell.nix { inherit pkgs inputs; })
  ];

  home.sessionVariables = {
    QT_ICON_THEME = "breeze";
  };

  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/hyprland/persona/hypr";
  xdg.configFile."quickshell".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/hyprland/persona/quickshell";
  home.file.".local/share/applications/org.quickshell.desktop".text = ''
    [Desktop Entry]
    Name=Quickshell
    Exec=qs
    Type=Application
    Categories=Utility;
  '';
}
