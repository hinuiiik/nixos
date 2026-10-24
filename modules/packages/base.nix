{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    xdg-user-dirs
    git
    wget
    curl
    micro
    nixfmt
    tree
    htop
    usbutils
    sbctl
    unzip
    wineWow64Packages.waylandFull
    python3
    nix-index
    alsa-utils
    ddcutil
    gparted

    hyprsunset
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
