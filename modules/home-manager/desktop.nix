{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    discord
    betterdiscordctl
    obsidian
    polybar-pulseaudio-control
    pavucontrol
    r2modman

    parsec-bin
    moonlight-qt
    prismlauncher

    inputs.zen-browser.packages."${system}".default
  ];

  # services = {
  #   # dunst = {
  #   #   enable = true;
  #   #   settings = {
  #   #     global = {
  #   #       width = 300;
  #   #       height = 300;
  #   #       offset = "30x50";
  #   #       origin = "top-right";
  #   #       transparency = 10;
  #   #     };
  #   #   };
  #   # };
  #   # flameshot = {
  #   #   enable = true;
  #   # };
  #   # udiskie = {
  #   #   enable = true;
  #   #   tray = "never";
  #   # };
  # };

  xdg.configFile = {
    "picom" = {
      source = ../../configurations/picom;
      recursive = true;
    };
  };

  # needed for obsidian
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  xdg.configFile = {
    "BetterDiscord/themes" = {
      source = ../../configurations/discordthemes;
      recursive = true;
    };
  };
}
