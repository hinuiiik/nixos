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
    inputs.hyprfm.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.kdePackages.kate
    pkgs.hicolor-icon-theme
    pkgs.localsend
    pkgs.kdePackages.breeze-icons
    pkgs.nwg-displays
    pkgs.nwg-look
    pkgs.kdePackages.qt6ct
    pkgs.unrar
    pkgs.hyprmoncfg
    #pkgs.udiskie
    pkgs.libgpg-error
  ];

  programs.zen-browser.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ]; # or -gtk depending on your DE, use -kde for Qt/KDE
    config.common.default = "*";
  };
}
	
