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

  security.pam.services = {
  };
}
