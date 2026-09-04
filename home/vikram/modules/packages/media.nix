{ pkgs, inputs, ... }:

{
  home.packages = [
	pkgs.discord
    pkgs.vesktop
    pkgs.vlc
    pkgs.nomacs
    pkgs.mpvpaper
    pkgs.moonlight-qt
	pkgs.pinta
	pkgs.telegram-desktop
	pkgs.anki
	pkgs.filezilla
	pkgs.sirikali
	pkgs.feishin
	pkgs.calibre
  ];
}
