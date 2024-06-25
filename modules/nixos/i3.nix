{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    configFile = ../../configurations/i3/config;

    extraPackages = with pkgs; [
      dmenu
      i3status
      i3blocks
    ];
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
