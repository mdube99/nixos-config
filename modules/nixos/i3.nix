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
  # services.xserver.windowManager.i3 = {
  #   enable = true;
  #   package = pkgs.i3-gaps;
  #   configFile = ../../configurations/i3/config;
  #
  #   extraPackages = with pkgs; [
  #     i3status
  #     i3blocks
  #     brightnessctl
  #     protonup-qt
  #     picom
  #   ];
  # };

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
      *dpi: 135
      Xft.dpi: 135
    ''}
  '';
  # systemd.tmpfiles.rules = [
  #   "L+ /run/gdm/.config/monitors.xml - - - - ${pkgs.writeText "gdm-monitors.xml" ''
  #     <monitors version="2">
  #       <configuration>
  #         <logicalmonitor>
  #           <x>0</x>
  #           <y>0</y>
  #           <scale>1</scale>
  #           <monitor>
  #             <monitorspec>
  #               <connector>eDP-1</connector>
  #               <vendor>BOE</vendor>
  #               <product>0x0bca</product>
  #               <serial>0x00000000</serial>
  #             </monitorspec>
  #             <mode>
  #               <width>2256</width>
  #               <height>1504</height>
  #               <rate>59.999</rate>
  #             </mode>
  #           </monitor>
  #         </logicalmonitor>
  #         <logicalmonitor>
  #           <x>2256</x>
  #           <y>0</y>
  #           <scale>1</scale>
  #           <primary>yes</primary>
  #           <monitor>
  #             <monitorspec>
  #               <connector>DP-10</connector>
  #               <vendor>GSM</vendor>
  #               <product>34GP950G</product>
  #               <serial>#GTIYMxgwABta</serial>
  #             </monitorspec>
  #             <mode>
  #               <width>3440</width>
  #               <height>1440</height>
  #               <rate>143.975</rate>
  #             </mode>
  #           </monitor>
  #         </logicalmonitor>
  #       </configuration>
  #     </monitors>
  #   ''}"
  # ];

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.autorandr = {
    enable = true;
  };
}
