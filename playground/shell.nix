let pkgs = import <nixpkgs> { system = builtins.currentSystem; config = {}; overlays = []; };
    iso-config = pkgs.path + /nixos/modules/installer/cd-dvd/installation-cd-minimal.nix;
    nixos = pkgs.nixos iso-config;
in
{ nixos = nixos.config.system.build.nixos-generate-config;
  shell = pkgs.mkShell {
    build= ''
      nix-build ${toString <nixpkgs/nixos>} -A vm -I nixpkgs=channel:nixos-23.11 -I nixos-config=./configuration.nix
    '';
    flbuild = '' nixos-rebuild --flake ./#hoskell build-vm -I nixpkgs=channel:nixos-23.11  -I nixos-config=./configuration.nix '';
    qemu = ''
      eval QEMU_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -nographic; reset
    '';
  };
}
