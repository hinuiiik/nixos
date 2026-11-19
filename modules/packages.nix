{
  imports = [
    ./packages/base.nix
    ./packages/kde-support.nix
    ./packages/services.nix
    ./packages/gaming.nix
    ./packages/udev.nix
    ./packages/fonts.nix
#    ./packages/custom/theos.nix
  ];

  #nixpkgs.config = {
  #   allowUnfree = true; # (Optional, but often needed for OnlyOffice)
  #  permittedInsecurePackages = [
  #   "gtk+-2.24.33"
  #];
  #};
  nixpkgs.config.problems.handlers = {
    "gtk+".broken = "warn"; # or "ignore"
  };
}
