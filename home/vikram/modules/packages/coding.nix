{ pkgs, ... }:
let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "13.0";
    platformToolsVersion = "37.0.1";
    buildToolsVersions = [ "35.0.0" ];
    platformVersions = [ "35" ];
    includeNDK = true;
    ndkVersions = [ "27.0.12077973" ]; # Tauri typically uses NDK 26 or 27
  };

  androidSdk = androidComposition.androidsdk;
in
{
  home.packages = [
	pkgs.python312
	pkgs.texliveFull
	#pkgs.cargo
	#pkgs.rustc
	pkgs.rustup
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
#	androidSdk
 ];

 programs.direnv = {
  enable = true;
  nix-direnv.enable = true;
};
}
