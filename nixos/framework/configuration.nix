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
    #../../modules/nixos/i3.nix
    ../../modules/nixos/desktop.nix
  ];
  # networking.hostName = "framework";
  networking.hostName = lib.mkForce "framework";

  # etworking.resolvconf.enable = lib.mkForce true;

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

    # Enable the uinput module
  boot.kernelModules = [ "uinput" ];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
        ;; Basic home row mods example using QWERTY
        ;; For a more complex but perhaps usable configuration,
        (defsrc
          caps a   s   d   f   j   k   l   ;
        )
        (defvar
          ;; Note: consider using different time values for your different fingers.
          ;; For example, your pinkies might be slower to release keys and index
          ;; fingers faster.
          tap-time 200
          hold-time 150
        )
        (defalias
          a (tap-hold $tap-time $hold-time a lctl)
          s (tap-hold $tap-time $hold-time s lalt)
          d (tap-hold $tap-time $hold-time d lmet)
          f (tap-hold $tap-time $hold-time f lsft)
          j (tap-hold $tap-time $hold-time j rsft)
          k (tap-hold $tap-time $hold-time k rmet)
          l (tap-hold $tap-time $hold-time l ralt)
          ; (tap-hold $tap-time $hold-time ; rctl)
        )
        (deflayer base
          esc @a  @s  @d  @f  @j  @k  @l  @;
        )
        '';
      };
    };
  };

  programs.localsend.enable = true;

  environment.systemPackages = with pkgs; [
    base16-schemes
    bibata-cursors
    dejavu_fonts
  ];
}
