{
  config,
  pkgs,
  lib,
  ...
}:

{
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.initrd.systemd.enable = true;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    settings.reboot-for-bitlocker = true;
    autoGenerateKeys.enable = true;
	configurationLimit = 4;
    autoEnrollKeys = {
    enable = true;
    autoReboot = true;
    };
    measuredBoot = {
      enable = true;
      pcrs = [
        0
        4
        7
     ];
    };
  };

}
