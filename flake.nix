{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dolphin-overlay = {
      url = "github:MattiDragon/dolphin-overlay";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
     # inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      #      inputs.nixpkgs.follows = "nixpkgs";
    };
	hyprdynamicmonitors.url = "github:fiffeek/hyprdynamicmonitors";
  };
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      agenix,
      lanzaboote,
      dolphin-overlay,
	hyprdynamicmonitors,
      ...
    }@inputs:
    let
      mkSystem =
        { hostModule, desktopProfile }:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.overlays = [ dolphin-overlay.overlays.default ]; }
            hostModule
		hyprdynamicmonitors.homeManagerModules.default
            agenix.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
            home-manager.nixosModules.home-manager
            inputs.vscode-server.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs desktopProfile;
              };
              home-manager.users.vikram = import ./home/vikram;
            }
          ];
        };
    in
    {
      nixosConfigurations.vm = mkSystem {
        hostModule = ./hosts/vm/configuration.nix;
        desktopProfile = "persona";
      };
      nixosConfigurations.laptop = mkSystem {
        hostModule = ./hosts/laptop/configuration.nix;
        desktopProfile = "noctalia";
      };
    };
}
