{ pkgs, inputs, ... }:
#let
#theos = pkgs.callPackage ./custom/theos.nix { };
#in
{
  environment.systemPackages = with pkgs; [
    pkgs.xdg-user-dirs
    pkgs.git
    pkgs.ffmpeg 
   pkgs.wget
    pkgs.curl
    pkgs.micro
    pkgs.nixfmt
    pkgs.tree
    pkgs.htop
    pkgs.usbutils
    pkgs.sbctl
    pkgs.unzip
    pkgs.wineWow64Packages.waylandFull
    pkgs.python3
    pkgs.nix-index
    pkgs.alsa-utils
    pkgs.ddcutil
    pkgs.gparted
    pkgs.udisks
    pkgs.hyprsunset
    pkgs.mpv
 #   theos    
#	inputs.nur-unstable-code.packages.${pkgs.system}.wshowlyrics
  ];
  
programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      pkgs.icu
      #    pkgs.libxcrypt-legacy
      #    pkgs.python312
      #    pkgs.python312Packages.torch
    ];
  };

}
