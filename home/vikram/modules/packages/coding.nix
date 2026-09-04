{ pkgs, ... }:

{
  home.packages = [
	pkgs.python311
	pkgs.texliveFull
	pkgs.cargo
	pkgs.rustc
	pkgs.gcc
	pkgs.glib.dev
	pkgs.glib
	pkgs.pkg-config
	pkgs.cairo.dev
	pkgs.cairo	
	pkgs.atk.dev
	pkgs.atk
	pkgs.pango.dev
	pkgs.pango
	pkgs.at-spi2-core
  ];
}
