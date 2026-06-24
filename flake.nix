{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
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
		inputs.nixpkgs.follows = "nixpkgs";	
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
#      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
nixConfig = {
  extra-substituters = [ "https://noctalia.cachix.org" ];
  extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
};
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      agenix,
      lanzaboote,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/vm/configuration.nix
          agenix.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          home-manager.nixosModules.home-manager
          inputs.vscode-server.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.vikram = import ./home/vikram;
          }
        ];
      };
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
          agenix.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          home-manager.nixosModules.home-manager
          inputs.vscode-server.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.vikram = import ./home/vikram;
          }
        ];
      };
    };
}
