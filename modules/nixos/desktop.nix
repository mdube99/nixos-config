{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  services.tailscale.enable = true;
  #virtualisation.virtualbox.host.enable = true;
  programs.virt-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  users.groups.libvirtd.members = ["mark"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  security.pam.services = {
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];
}
