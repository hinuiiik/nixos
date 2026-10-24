{ pkgs, inputs, ... }:

{
  home.packages = [
#	inputs.nur-unstable-code.packages.${pkgs.stdenv.hostPlatform.system}.wshowlyrics-unstable
  ];
}
