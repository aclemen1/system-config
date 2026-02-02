{
  description = "My NixOS configuration";
  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      # url = "github:nix-community/home-manager/release-24.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      # url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    # nixvim = {
    #     url = "github:nix-community/nixvim/nixos-24.11";
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = inputs: {
    darwinConfigurations = {
      "omicron" = inputs.darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import inputs.nixpkgs {
          system = "aarch64-darwin";
          config = {
            allowUnfree = true;
          };
        };
        modules = [
          ./omicron/configuration.nix 
          # inputs.home-manager.darwinModules.home-manager {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.sharedModules = [
          #     inputs.nixvim.homeManagerModules.nixvim
          #   ];
          # }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
