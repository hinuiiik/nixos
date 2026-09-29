{ pkgs, inputs, ... }:

{
  home.packages = [
	inputs.nur-unstable-code.packages.${pkgs.system}.wshowlyrics
  ];
}
