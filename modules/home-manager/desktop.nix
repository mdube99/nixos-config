{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    waydroid
    obsidian
    wdisplays
    networkmanagerapplet
    dunst
    wl-clipboard
    libnotify
    flameshot
    xdg-desktop-portal-hyprland
    hypridle
  ];

  # needed for obsidian
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  stylix = {
    enable = true;
    image = ../../configurations/wallpapers/facet.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
