{ pkgs, ... }:

{
  home.packages = [
    pkgs.qt6.qtimageformats
    pkgs.kdePackages.qtmultimedia
    pkgs.qt6.qt5compat
  ];
}