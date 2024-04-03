# pkgs are available through config._modules.args = { inherit pkgs; }; 
{ lib, pkgs, ...}:
{
  options = {
    scripts.output = lib.mkOption {
      type = lib.types.lines;
    };
  };
  # config = {
  #   scripts.output = 42;
  # };
  # config = {
  #   scripts = {
  #     output = ''
  #       ./map size=640x640 scale=2 | feh -
  #     '';
  #   };
  # };
  config = {
    scripts = {
      output = pkgs.writeShellApplication = {
        name = "map"
        runtimeInputs = with pkgs; [curl feh];
        text = ''
          ${./map} size=640x640 scale=2 | feh -
        '';
      };
    };
}
