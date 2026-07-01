{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse # to mount remote filesystems via FUSE
    kdePackages.qtsvg
    kdePackages.kio-extras # extra protocols support (sftp, fish and more)
  ];
}