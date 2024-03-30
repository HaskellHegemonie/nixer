{ pkgs, nixos, modulePath, lib, ...}:
{
  imports = [
    # modulesPath defaults to  <nixpkgs/nixos/modules>
    # "${modulePath}/installer/cv-dvd/installation-cd-minimal.nix"
  ];

  environment = {
    systemPackages = with pkgs; [
      vim
    ];
    shellAliases = {
      doas = "sudo";
    };
    # Use shared filesystems instead
    # etc = {
    #   nixos-config = {
    #     source = ../playground/configuration.nix;
    #   };
    # };
  };

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      experimentalFeatures = [ "flakes" "nix-command" ];
    };
  };

  services = {
    xserver = {
      layout = "us";
      xkbVariant = "dvp";
    };
  };

  console = {
    useXkbConfig = true;
  };
}
