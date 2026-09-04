{ config, pkgs, ... }:

let
  myCustomUdevRules = pkgs.writeTextFile {
    name = "tablet-rules";
    text = ''
      # Wacom CTH-480
KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0302", TAG+="uaccess", TAG+="udev-acl"
SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0302", TAG+="uaccess", TAG+="udev-acl"
# Wacom CTH-680
KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0303", TAG+="uaccess", TAG+="udev-acl"
SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0303", TAG+="uaccess", TAG+="udev-acl"
# Wacom Cintiq 13HD (DTK-1300)
KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0304", TAG+="uaccess", TAG+="udev-acl"
SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0304", TAG+="uaccess", TAG+="udev-acl"
# Wacom CTL-480
KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", TAG+="uaccess", TAG+="udev-acl"
SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", TAG+="uaccess", TAG+="udev-acl"
    '';
    destination = "/lib/udev/rules.d/50-tablet.rules";
  };
in
{
  services.udev.packages = [ myCustomUdevRules ];
}
