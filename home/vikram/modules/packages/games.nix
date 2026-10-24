{ pkgs, inputs, ... }:

{
  home.packages = [
	pkgs.ppsspp
	pkgs.protontricks	
	pkgs.scanmem
  ];
}
