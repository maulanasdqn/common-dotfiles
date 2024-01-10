{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    devenv.url = "github:cachix/devenv";

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

  outputs = { nixpkgs, home-manager, ... }: {
    defaultPackage.aarch64-linux = home-manager.defaultPackage.aarch64-linux;
    homeConfigurations = {
      ms = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          config = { allowUnfree = true; };
          system = "aarch64-linux";
        };
        modules = [ ./home ];
      };
    };
  };

}
