{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    waydroid
    obsidian
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
