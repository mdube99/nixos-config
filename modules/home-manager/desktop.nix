{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    waydroid
    obsidian
    wdisplays
    networkmanagerapplet
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
