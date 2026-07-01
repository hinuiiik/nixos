{
  inputs,
  desktopProfile ? "noctalia",
  ...
}:
let
  desktopModule = if desktopProfile == "persona" then ./modules/desktop/persona else ./modules/desktop/noctalia;
in
{
  imports = [
    ./modules/packages/fish.nix
    ./modules/packages/kitty.nix
    ./modules/desktop/common.nix
    ./modules/packages/core.nix
    ./modules/packages/qt.nix
    ./modules/packages/media.nix
    ./modules/packages/work.nix
    desktopModule
  ];
  home.username = "vikram";
  home.homeDirectory = "/home/vikram";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
