{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    xdg-user-dirs
    git
    wget
    curl
    micro
    nixfmt
    tree
    htop
    sbctl
	kdePackages.dolphin
	kdePackages.ark
	unzip
	kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
	kdePackages.qtsvg
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
#	steam
  ];

#  programs.fish.enable = true;
  services.vscode-server.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true; 
	programs.steam = {
  enable = true;
};


}
