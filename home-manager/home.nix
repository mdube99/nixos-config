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
    lsd = {
      enable = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    zellij = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    unstable.goose-cli
    unstable.zed-editor
    dconf
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
    tree
    pipx
    uv

    # network stuff
    nmap
    whois
    dig
    openssl

    # devops
    docker
    awscli2
    wireguard-tools
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
