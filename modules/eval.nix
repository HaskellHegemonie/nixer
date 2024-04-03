let
  system = builtins.currentSystem;
  pkgs = import <nixpkgs> { inherit system; config = {}; overlays = []; };
  lib = pkgs.lib;
in

lib.evalModules {
  modules = [
    ({config, ...}: {config._modules.args = {inherit pkgs;}; })
    ./default.nix
  ];
}
