{ pkgs, ... }:
let
  customHardwareRules = pkgs.writeTextFile {
    name = "custom-hardware-rules";
    destination = "/lib/udev/rules.d/60-hardware.rules";
    text = ''
      KERNEL=="hidraw*", ATTRS{idVendor}=="056a", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTR{idVendor}=="0ac3", TAG+="uaccess"
    '';
  };
in
{
  services.vscode-server.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.udev.packages = [ customHardwareRules ];
  services.flatpak.enable = true;
}
