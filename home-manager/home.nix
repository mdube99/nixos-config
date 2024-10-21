# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  overlays,
  ...
}: let
  # Define your Stylix colors here
  stylixColors = config.lib.stylix.colors.withHashtag;
  base0D = stylixColors.base0D;
  # Define the specific color you want to use for tmux
  tmuxPowerThemeColor = base0D; # Adjust this as per your preference
in {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    ../modules/home-manager
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "mark";
    homeDirectory = "/home/mark";
    sessionVariables.EDITOR = "nvim";
  };

  home.file.".local/bin" = {
    source = ../configurations/scripts;
    recursive = true;
  };

  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zellij = {
      enable = true;
      settings = {
        simplified_ui = true;
        copy_command = "wl-copy";
        pane_frames = false;
        default_layout = "compact";
      };
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    sesh
    bat
    bottom
    coreutils
    du-dust
    fd
    killall
    btop
    htop
    findutils
    jq
    zip
    unzip
    updog
    any-nix-shell
    ripgrep
    acpi

    cargo
    rustc
    go
    lua
    nodejs
    python3

    xsel
    xclip
    gcc
    tree
    pipx
    poetry

    # network stuff
    nmap
    whois
    dig
    openssl

    # devops
    docker
    awscli2
    terraform
    ansible
    wireguard-tools

    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
  ];

  programs.home-manager.enable = true;

  home.sessionPath = [
    "$HOME/.local/bin:$PATH"
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
