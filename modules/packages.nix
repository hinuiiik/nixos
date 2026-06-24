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
  ];

#  programs.fish.enable = true;
  services.vscode-server.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true; 
}
