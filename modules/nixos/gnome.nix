{ config, pkgs, lib, ... }:

let
  flameshot-gui = pkgs.writeShellScriptBin "flameshot-gui" "${pkgs.flameshot}/bin/flameshot gui";
in
{
  # Enable the GNOME Desktop Environment
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Install basic programs mentioned in the config
  environment.systemPackages = with pkgs; [
    # GNOME extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.custom-accent-colors
    gnomeExtensions.just-perfection
    gnomeExtensions.space-bar
    gnomeExtensions.tactile
    gnomeExtensions.undecorate
    gnomeExtensions.user-themes
  ];

  # Configure desktop settings and keybindings
  programs.dconf.enable = true;
  
  # System-wide dconf settings
  programs.dconf.profiles = {
    user.databases = [{
      settings = {
        # Gnome window management keybindings
        "org/gnome/desktop/wm/keybindings" = {
          close = ["<Super>w"];
          maximize = ["<Super>Up"];
          begin-resize = ["<Super>BackSpace"];
          toggle-fullscreen = ["<Shift>F11"];
          # Use an array with null for empty array
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
          switch-to-workspace-5 = ["<Super>5"];
          switch-to-workspace-6 = ["<Super>6"];
        };

        # Workspace configuration
        "org/gnome/mutter" = {
          dynamic-workspaces = false;
          edge-tiling = true;
          center-new-windows = true;
        };
        
        # Custom keybindings
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          name = "Ulauncher";
          command = "ulauncher-toggle";
          binding = "<Super>space";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          name = "Flameshot";
          command = "${flameshot-gui}/bin/flameshot-gui";
          binding = "<Control>Print";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
          name = "Alacritty";
          command = "alacritty";
          binding = "<Shift><Alt>2";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
          name = "New Browser Window";
          command = "firefox"; # Change to your preferred browser
          binding = "<Shift><Alt>1";
        };

        # Use alt for pinned apps
        "org/gnome/shell/keybindings" = {
          switch-to-application-1 = ["<Alt>1"];
          switch-to-application-2 = ["<Alt>2"];
          switch-to-application-3 = ["<Alt>3"];
          switch-to-application-4 = ["<Alt>4"];
          switch-to-application-5 = ["<Alt>5"];
          switch-to-application-6 = ["<Alt>6"];
          switch-to-application-7 = ["<Alt>7"];
          switch-to-application-8 = ["<Alt>8"];
          switch-to-application-9 = ["<Alt>9"];
        };

        # Basic interface settings
        "org/gnome/desktop/interface" = {
          enable-hot-corners = false;
          show-battery-percentage = true;
        };

        # Emoji compose key
        "org/gnome/desktop/input-sources" = {
          xkb-options = ["compose:caps"];
        };

        # Enable GNOME extensions
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "just-perfection-desktop@just-perfection"
            "space-bar@luchrioh"
            "tactile@lundal"
            "undecorate@sun.wxg@gmail.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
          ];
        };
      };
    }];
  };

}
