{
  pkgs,
  lib,
  config,
  ...
}: {
  config = {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      style = with config.lib.stylix.colors.withHashtag;
        ''
          @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
          @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};

          @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
          @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};
        ''
        + builtins.readFile ../../configurations/waybar/style.css;
      settings = {
        bar = {
          layer = "top";
          height = 30;
          spacing = 0;
          margin-top = 0;
          margin-left = 0;
          margin-right = 0;
          margin-bottom = 0;
          modules-left = ["hyprland/workspaces"];
          modules-center = ["clock"];
          modules-right = ["cpu" "memory" "backlight" "pulseaudio" "battery" "tray"];
          "hyprland/workspaces" = {
            format = "{icon}";
            "format-icons" = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "10" = "10";
              # urgent = "λ";
              # focused = "σ";
              # default = "ω";
            };
          };
          "tray" = {
            spacing = 10;
          };
          "clock" = {
            "format" = "<span color='#bf616a'>  </span>{ =%I =%M %p}";
            "format-alt" = "<span color='#bf616a'> </span>{ =%a %b %d}";
            "tooltip-format" = "<big>{ =%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          };
          "cpu" = {
            interval = 10;
            format = "  {usage}%";
            max-length = 10;
            on-click = "";
          };
          "memory" = {
            interval = 30;
            format = "  {}%";
            format-alt = " {used =0.1f}G";
            max-length = 10;
          };
          "backlight" = {
            device = "eDP-1";
            format = "{icon} {percent}%";
            format-icons = ["" "" "" "" "" "" "" "" ""];
            on-click = "";
          };
          "battery" = {
            "states" = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰂄";
            format-plugged = "{capacity}% ";
            format-alt = "{icon}";
            format-icons = ["󱃍" "󰁼" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          };
          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "  {volume}%";
            format-bluetooth-muted = " ";
            format-muted = "婢";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            on-click = "pavucontrol";
          };
        };
      };
    };
  };
}
