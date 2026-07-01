{ pkgs, ... }:

{
  home.packages = [
    pkgs.vesktop
    pkgs.vlc
    pkgs.nomacs
    pkgs.mpvpaper
    pkgs.moonlight-qt
  ];
}