{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.steam.enable = true;
  services.tailscale.enable = true;
}
