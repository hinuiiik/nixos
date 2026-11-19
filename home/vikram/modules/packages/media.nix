{ pkgs, inputs, ... }:
#let
#tilp = pkgs.callPackage ./custom/tilp.nix { };
#in
{
  home.packages = [
    (pkgs.discord.override {
      #    withVencord = true;
    })
    pkgs.vlc
    pkgs.nomacs
    pkgs.mpvpaper
    pkgs.moonlight-qt
    pkgs.pinta
    pkgs.telegram-desktop
    pkgs.anki-bin
    pkgs.filezilla
    pkgs.sirikali
    pkgs.feishin
    #pkgs.calibre
    pkgs.zoom-us
    pkgs.krita
    pkgs.playerctl
    pkgs.smplayer
    inputs.kotonoha.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.mission-center
    pkgs.libepoxy
    pkgs.libXv
    pkgs.ntfs3g
    pkgs.libmtp
    pkgs.exiftool
    pkgs.rclone
    pkgs.gvfs
  ];
}
