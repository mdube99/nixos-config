{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;

      displayManager.gdm.enable = true;
      # services.xserver.desktopManager.gnome.enable = true;
      libinput.naturalScrolling = true;
    };
  };

  programs.i3lock.enable = true;

  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
      *dpi: 135
      Xft.dpi: 135
    ''}
  '';

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.autorandr = {
    enable = true;
  };
}
