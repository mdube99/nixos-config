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
    "BetterDiscord/themes" = {
      source = ../../configurations/discordthemes;
      recursive = true;
    };
  };
}
