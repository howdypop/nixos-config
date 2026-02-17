# flake.nix

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    buildableHosts =
      builtins.attrNames
        (lib.filterAttrs (name: type:
          type == "directory"
          && !(lib.strings.hasPrefix "_" name)
          && !(lib.strings.hasPrefix "." name)
          && builtins.pathExists (./hosts/${name}/default.nix)
        )
        (builtins.readDir ./hosts)
      );

    mkHost = hostname: lib.nixosSystem {
      inherit system;

      modules = [
        ./modules/common.nix
        ./hosts/${hostname}

        home-manager.nixosModules.home-manager
        ({ lib, ... }: {
          networking.hostName = lib.mkDefault hostname;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        })
      ];
    }; 
  in
  {
    nixosConfigurations = lib.genAttrs buildableHosts mkHost;
  };
}
