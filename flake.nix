{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    devenv.url = "github:cachix/devenv/latest";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    trusted-users = [ "root" "ms" ];
  };

  outputs = { nixpkgs, home-manager, self, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
    in {
      inherit lib;
      defaultPackage.aarch64-linux = home-manager.defaultPackage.aarch64-linux;
      homeConfigurations = {
        ms = lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            config = { allowUnfree = true; };
            system = "aarch64-linux";
          };
          modules = [ ./home ];
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };

}
