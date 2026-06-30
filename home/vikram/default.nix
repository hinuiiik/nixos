{
  config,
  pkgs,
  inputs,
  ...
}:
let
  dotfiles = "/home/vikram/dotfiles";
in
{
  imports = [
    ./fish.nix
    ./kitty.nix
#    ./modules/hypr-persona
	./modules/hypr-noctalia
  ];
  home.username = "vikram";
  home.homeDirectory = "/home/vikram";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
  
  home.packages = [
    pkgs.kitty
	pkgs.fish
	pkgs.pokemon-colorscripts
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.kdePackages.kate
    #pkgs.kdePackages.dolphin
#    pkgs.qt6.qtsvg
    pkgs.qt6.qtimageformats
    pkgs.kdePackages.qtmultimedia
    pkgs.qt6.qt5compat
    pkgs.hicolor-icon-theme
	pkgs.localsend
    pkgs.kdePackages.breeze-icons
    pkgs.nwg-displays
	pkgs.vesktop
	pkgs.vlc
	pkgs.nomacs
	pkgs.nwg-look
	pkgs.kdePackages.qt6ct

	pkgs.digital
	pkgs.rambox
	pkgs.vscode
	pkgs.mpvpaper
	pkgs.onlyoffice-desktopeditors
 ];
services.hyprpolkitagent.enable = true;
  #xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hypr";

	xdg.desktopEntries.digital = {
    categories= ["Education" "Electronics"];
    comment="Easy-to-use digital logic designer and circuit simulator";
    exec="env GDK_DPI_SCALE=1.25 digital -Dsun.java2d.uiScale=1.25";
    icon="digital";
    # keywords=["simulator" "digital" "circuits"];
   # mimeType="text/x-digital";
    name="Digital";
    terminal=false;
    type="Application";
    # version="1.5";
  };
}
