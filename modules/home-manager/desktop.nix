{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    betterdiscordctl
    waydroid
    obsidian
    wdisplays
    networkmanagerapplet
    wl-clipboard
    libnotify
    xdg-desktop-portal-hyprland
    hypridle
    blueman

    # for screenshotting
    grim
    slurp
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

  programs.wofi.enable = true;

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          # placeholder_text = '\'<span foreground="##cad3f5">Password...</span>'\';
          shadow_passes = 2;
        }
      ];
    };
  };

  # needed for obsidian
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  services.kanshi = {
    enable = true;
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

  # stylix = {
  #   enable = true;
  #   image = ../../configurations/wallpapers/facet.jpg;
  #
  #   base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark-terminal.yaml";
  #   polarity = "dark"; # “light” or “either”
  #   cursor.package = pkgs.bibata-cursors;
  #   cursor.name = "Bibata-Modern-Ice";
  #
  #   fonts = {
  #     monospace = {
  #       package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
  #       name = "JetBrainsMono Nerd Font Mono";
  #     };
  #     sansSerif = {
  #       package = pkgs.dejavu_fonts;
  #       name = "DejaVu Sans";
  #     };
  #     serif = {
  #       package = pkgs.dejavu_fonts;
  #       name = "DejaVu Serif";
  #     };
  #   };
  # };
}
