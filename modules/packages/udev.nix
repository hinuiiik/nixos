{ config, pkgs, ... }:

let
  # myCustomUdevRules = pkgs.writeTextFile {
  #   name = "tablet-rules";
  #   text = ''
  #           # Wacom CTH-480
  #     KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0302", TAG+="uaccess", TAG+="udev-acl"
  #     SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0302", TAG+="uaccess", TAG+="udev-acl"
  #     # Wacom CTH-680
  #     KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0303", TAG+="uaccess", TAG+="udev-acl"
  #     SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0303", TAG+="uaccess", TAG+="udev-acl"
  #     # Wacom Cintiq 13HD (DTK-1300)
  #     KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0304", TAG+="uaccess", TAG+="udev-acl"
  #     SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0304", TAG+="uaccess", TAG+="udev-acl"
  #     # Wacom CTL-480
  #     KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", TAG+="uaccess", TAG+="udev-acl"
  #     SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", TAG+="uaccess", TAG+="udev-acl"
  #   '';
  #   destination = "/lib/udev/rules.d/50-tablet.rules";
  # };
  orbiscreen = pkgs.callPackage ./custom/orbiscreen.nix { };
in
{
  environment.systemPackages = [
	orbiscreen
  ];
  users.groups.orbiscreen = {};
  users.users.vikram.extraGroups = [
  "orbiscreen"
];  
services.udev.packages = [ orbiscreen ];
  services.udev.extraRules = ''
  SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d00", GROUP="orbiscreen", MODE="0660"
  SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d01", GROUP="orbiscreen", MODE="0660"
  SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d04", GROUP="orbiscreen", MODE="0660"
  SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d05", GROUP="orbiscreen", MODE="0660"
'';

 networking.firewall.allowedTCPPorts = [ 8788 ];
networking.firewall.allowedUDPPorts = [ 8789 5353 ];
}
