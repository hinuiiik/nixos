{ pkgs, inputs, ... }:

let
  qs = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
in

pkgs.stdenv.mkDerivation {
  name = "quickshell-wrapped";

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [
    pkgs.makeWrapper
    pkgs.qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qs
    pkgs.kdePackages.qtmultimedia
    pkgs.qt6.qtdeclarative
    pkgs.qt6.qt5compat
    pkgs.kdePackages.qtwayland
  ];

  installPhase = ''
    mkdir -p $out/bin

    makeWrapper ${qs}/bin/qs $out/bin/qs
  '';
}