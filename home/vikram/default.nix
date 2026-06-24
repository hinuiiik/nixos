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
    pkgs.kdePackages.dolphin
    pkgs.qt6.qtsvg
    pkgs.qt6.qtimageformats
    pkgs.kdePackages.qtmultimedia
    pkgs.qt6.qt5compat
    pkgs.hicolor-icon-theme
    pkgs.kdePackages.breeze-icons
    pkgs.nwg-displays
	pkgs.vesktop
	pkgs.vlc
	pkgs.nomacs
	pkgs.nwg-look
	pkgs.kdePackages.qt6ct

	pkgs.digital
 ];

  #xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hypr";
}
