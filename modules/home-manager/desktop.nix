{
  inputs,
  outputs,
  pkgs,
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


  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
          "space-bar"
          "tactile"
          "undecorate"
        ];
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
