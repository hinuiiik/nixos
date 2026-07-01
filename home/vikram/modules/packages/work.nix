{ pkgs, ... }:

{
  home.packages = [
    pkgs.digital
    pkgs.rambox
    pkgs.vscode
    pkgs.onlyoffice-desktopeditors
  ];

  xdg.desktopEntries.digital = {
    categories = [ "Education" "Electronics" ];
    comment = "Easy-to-use digital logic designer and circuit simulator";
    exec = "env GDK_DPI_SCALE=1.25 digital -Dsun.java2d.uiScale=1.25";
    icon = "digital";
    name = "Digital";
    terminal = false;
    type = "Application";
  };
}