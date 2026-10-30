{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";   # zelfde versie als `nixos-version`
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      mkHost = hostName: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/${hostName}/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.chris = import ./home.nix;
          }
        ];
      };
    in {
      nixosConfigurations = {
        nixos-vm = mkHost "nixos-vm";
        # laptop = mkHost "laptop";   # aanzetten in stap 7
      };
    };
}
