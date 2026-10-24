{ pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  home.packages = [
    pkgs.kitty
    pkgs.fish
    pkgs.pokemon-colorscripts
    # inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system
    pkgs.kdePackages.kate
    pkgs.hicolor-icon-theme
    pkgs.localsend
    pkgs.kdePackages.breeze-icons
    pkgs.nwg-displays
    pkgs.nwg-look
    pkgs.kdePackages.qt6ct
    pkgs.unrar
    pkgs.hyprmoncfg
    pkgs.udiskie
  ];

  programs.zen-browser.enable = true;
}
	
