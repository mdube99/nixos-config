# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ../modules/home-manager
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      #neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
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

  #xdg.configFile."nvim" = {
  #source = ./nvim;
  #recursive = true;
  #};

  #home.file.".Xresources".source = ../configurations/x/.Xresources;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  home.packages = with pkgs; [
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
    ripgrep

    cargo
    rustc
    go
    lua
    nodejs
    python3
    pyright
    ruff
    nil # nix

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

    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  home.sessionPath = [
    "$HOME/.local/bin:$PATH"
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
