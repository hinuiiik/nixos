{ pkgs, ... }:

{
  home.packages = [
    pkgs.digital
    pkgs.rambox
    pkgs.vscode
    pkgs.onlyoffice-desktopeditors
    pkgs.jetbrains-toolbox
    pkgs.nodejs
    pkgs.pnpm
    pkgs.mars-mips
    pkgs.openjdk
    pkgs.google-chrome
    pkgs.slack
    pkgs.protonmail-desktop
    pkgs.thunderbird
  ];

  xdg.desktopEntries.digital = {
    categories = [
      "Education"
      "Electronics"
    ];
    comment = "Easy-to-use digital logic designer and circuit simulator";
    exec = "env GDK_DPI_SCALE=1.25 digital -Dsun.java2d.uiScale=1.25";
    icon = "digital";
    name = "Digital";
    terminal = false;
    type = "Application";
  };
  xdg.desktopEntries.mars = {
    categories = [
      "Development"
      "IDE"
    ];
    comment = "IDE for programming in MIPS assembly language intended for educational-level use";
    exec = "env GDK_DPI_SCALE=1.25 GTK_THEME=Adwaita:light Mars";
    icon = "mars";
    name = "MARS";
    terminal = false;
    type = "Application";
  };
}
