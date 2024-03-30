# {
#   description = "description";
#   inputs = {
#     nixos = {
#       url = "github:NixOS/nixpkgs/23.11-beta";
#     };
#   };
#   outputs = {self, nixpkgs, ...}@inputs:
#     in
#       {
#         nixosConfigurations = {
#           vmISO = nixpkgs.lib.nixosSystem {
#             specialArgs = { inherit inputs; };
#             modules = [
#               ./configuration.nix
#             ];
#           };
#         };
#       };
# }
      
{
  description = "Minimal NixOS installation media";
  inputs.nixos.url = "github:NixOS/nixpkgs/23.11-beta";
  outputs = { self, nixos }: {
    nixosConfigurations = {
      exampleIso = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./iso-configuration.nix
        ];
      };
    };
  };
}
