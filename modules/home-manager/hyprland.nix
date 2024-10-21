{
  pkgs,
  inputs,
  config,
  asztal,
  lib,
  ...
}: {
  xdg.configFile = {
    "hypr" = {
      source = ../../configurations/hypr;
      recursive = true;
    };
    "waybar" = {
      source = ../../configurations/waybar;
      recursive = true;
    };
    "wofi" = {
      source = ../../configurations/wofi;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    hypridle
    tailscale-systray
  ];
}
