{ pkgs, ... }:

let
  applyPowerState = pkgs.writeShellApplication {
    name = "apply-ac-power-state";
    runtimeInputs = [
      pkgs.brightnessctl
      pkgs.power-profiles-daemon
    ];
    text = ''
      set -eu

      find_adapter() {
        for supply in /sys/class/power_supply/*; do
          [ -e "$supply/online" ] || continue
          if [ -r "$supply/type" ] && [ "$(cat "$supply/type")" = "Mains" ]; then
            printf '%s\n' "$supply"
            return 0
          fi
        done

        for supply in /sys/class/power_supply/*; do
          [ -e "$supply/online" ] || continue
          printf '%s\n' "$supply"
          return 0
        done

        return 1
      }

      adapter="''${1:-}"
      if [ -z "$adapter" ]; then
        adapter="$(find_adapter)"
      else
        adapter="/sys/class/power_supply/$adapter"
      fi

      [ -r "$adapter/online" ] || exit 0

      if [ "$(cat "$adapter/online")" = "1" ]; then
        powerprofilesctl set performance
        brightnessctl set 100%
      else
        powerprofilesctl set power-saver
        brightnessctl set 40%
      fi
    '';
  };
in
{
  systemd.services.laptop-ac-power-profile = {
  description = "Set laptop power profile and brightness based on AC state";

  #wantedBy = [ "multi-user.target" ];
  requires = [ "power-profiles-daemon.service" ];
  after = [ "power-profiles-daemon.service" ];

  serviceConfig = {
    Type = "oneshot";
    ExecStart = "${applyPowerState}/bin/apply-ac-power-state";
  };
};

  services.udev.extraRules = ''
    ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", TAG+="systemd", ENV{SYSTEMD_WANTS}+="laptop-ac-power-profile.service"
  '';
}
