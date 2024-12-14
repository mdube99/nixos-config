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
    #../../modules/nixos/hyprland.nix
    ../../modules/nixos/i3.nix
    ../../modules/nixos/desktop.nix
  ];
  networking.hostName = "framework";
  networking.resolvconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  boot = {
    initrd.luks.devices."luks-07d01450-5604-456e-8e6c-24e209f22c8a".device = "/dev/disk/by-uuid/07d01450-5604-456e-8e6c-24e209f22c8a";
    kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_6_8;
    initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt"];

    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };

  services.blueman.enable = true;
  services.logind.lidSwitch = "ignore";
  time.timeZone = "America/Chicago";

  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [
    base16-schemes
    bibata-cursors
    dejavu_fonts
    nerdfonts
  ];
}
