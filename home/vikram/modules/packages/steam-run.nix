{ pkgs, ... }:

let
  steamRunOpen = pkgs.writeShellApplication {
    name = "steam-run-open";
    runtimeInputs = [ pkgs.steam-run ];
    text = ''
      set -eu

      if [ "$#" -lt 1 ]; then
        exit 1
      fi

      exec ${pkgs.steam-run}/bin/steam-run "$1"
    '';
  };
in
{
  home.packages = [ steamRunOpen ];

  xdg.dataFile."kio/servicemenus/steam-run.desktop".text = ''
    [Desktop Entry]
    Type=Service
    MimeType=application/x-executable;application/x-shellscript;
    Actions=SteamRun;
    X-KDE-Priority=TopLevel

    [Desktop Action SteamRun]
    Name=Run with Steam Runtime
    Icon=steam
    Exec=${steamRunOpen}/bin/steam-run-open %f
  '';
}