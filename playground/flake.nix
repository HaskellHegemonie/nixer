{
  description = "description";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self, nixpkgs, home-manager}@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config = {}; overlays = []; };
    in
      { 
        nixosConfigurations = {
          hoskell = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [ ./configuration.nix ];
          };
        };
      };
}
