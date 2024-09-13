{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    betterdiscordctl
    # waydroid
    obsidian
    # wdisplays
    arandr
    feh
    networkmanagerapplet
    # wl-clipboard
    libnotify
    polybar-pulseaudio-control
    #xdg-desktop-portal-hyprland
    # hypridle
    blueman
    pavucontrol
    r2modman

    parsec-bin
    moonlight-qt
  ];

  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
        };
      };
    };
    flameshot = {
      enable = true;
    };
    udiskie = {
      enable = true;
      tray = "never";
    };
  };

  xdg.configFile = {
    "picom" = {
      source = ../../configurations/picom;
      recursive = true;
    };
  };

  programs.rofi = {
    enable = true;
  };
  services.polybar = {
    enable = true;
    script = "polybar -c $HOME/nixos-config/configurations/polybar/config.ini";
  };

  # programs.hyprlock = {
  #   enable = true;
  #   settings = {
  #     general = {
  #       disable_loading_bar = true;
  #       grace = 300;
  #       hide_cursor = true;
  #       no_fade_in = false;
  #     };
  #
  #     background = [
  #       {
  #         path = "screenshot";
  #         blur_passes = 3;
  #         blur_size = 8;
  #       }
  #     ];
  #
  #     input-field = [
  #       {
  #         size = "200, 50";
  #         position = "0, -80";
  #         monitor = "";
  #         dots_center = true;
  #         fade_on_empty = false;
  #         font_color = "rgb(202, 211, 245)";
  #         inner_color = "rgb(91, 96, 120)";
  #         outer_color = "rgb(24, 25, 38)";
  #         outline_thickness = 5;
  #         # placeholder_text = '\'<span foreground="##cad3f5">Password...</span>'\';
  #         shadow_passes = 2;
  #       }
  #     ];
  #   };
  # };

  stylix.targets.alacritty.enable = false;
  stylix.targets.bat.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#ffffff";
          foreground = "#1F2328";
        };
        cursor = {
          text = "#ffffff";
          cursor = "#1f2328";
        };
        normal = {
          black = "#24292f";
          red = "#cf222e";
          green = "#116329";
          yellow = "#4d2d00";
          blue = "#0969da";
          magenta = "#8250df";
          cyan = "#1b7c83";
          white = "#6e7781";
        };
        bright = {
          black = "#57606a";
          red = "#a40e26";
          green = "#1a7f37";
          yellow = "#633c01";
          blue = "#218bff";
          magenta = "#8250df";
          cyan = "#1b7c83";
          white = "#6e7781";
        };
      };
      font.size = 14;
    };
  };

  # needed for obsidian
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  services.kanshi = {
    enable = false;
    systemdTarget = "hyprland-session.target";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };

      home_office = {
        outputs = [
          {
            criteria = "DP-10";
            position = "0,0";
            mode = "3440x1440@144Hz";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      };
    };
  };
}
