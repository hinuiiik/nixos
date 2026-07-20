{ pkgs, ... }:

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
    sbctl
    unzip
    wineWow64Packages.waylandFull
	python3
  ];
}
