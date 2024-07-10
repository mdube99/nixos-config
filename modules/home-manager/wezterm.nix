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


      config.enable_tab_bar = false

      -- config.default_prog = { 'zellij', '-l', 'welcome' }

      -- and finally, return the configuration to wezterm

      return config
    '';
  };
}
