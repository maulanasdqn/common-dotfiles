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
    extra-trusted-public-keys =
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
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
