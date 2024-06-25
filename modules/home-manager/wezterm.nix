{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      -- Pull in the wezterm API
      local wezterm = require 'wezterm'

      -- This will hold the configuration.
      local config = wezterm.config_builder()

      config.enable_wayland = false


      -- This is where you actually apply your config choices

      -- For example, changing the color scheme:
      config.color_scheme = 'tokyonight_night'
      config.enable_tab_bar = false

      -- and finally, return the configuration to wezterm

      return config
    '';
  };
}
