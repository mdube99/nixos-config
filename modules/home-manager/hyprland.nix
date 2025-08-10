{
  pkgs,
  inputs,
  config,
  asztal,
  lib,
  ...
}: {

  home.packages = with pkgs; [
    hypridle
    tailscale-systray
    brightnessctl
  ];
}
