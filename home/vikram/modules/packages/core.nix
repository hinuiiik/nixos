{ pkgs, inputs, ... }:

{
  home.packages = [
    pkgs.kitty
    pkgs.fish
    pkgs.pokemon-colorscripts
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.kdePackages.kate
    pkgs.hicolor-icon-theme
    pkgs.localsend
    pkgs.kdePackages.breeze-icons
    pkgs.nwg-displays
    pkgs.nwg-look
    pkgs.kdePackages.qt6ct
	pkgs.unrar
  ];
}
