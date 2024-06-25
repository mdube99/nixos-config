# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ../configuration.nix
    ../../modules/nixos/sway.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/desktop.nix
  ];
  networking.hostName = "framework";

  boot.initrd.luks.devices."luks-07d01450-5604-456e-8e6c-24e209f22c8a".device = "/dev/disk/by-uuid/07d01450-5604-456e-8e6c-24e209f22c8a";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";

  stylix.image = ../../configurations/wallpapers/facet.jpg;

  environment.systemPackages = with pkgs; [
    base16-schemes
  ];
}
