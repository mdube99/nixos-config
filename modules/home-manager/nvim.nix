{
  pkgs,
  config,
  lib,
  ...
}: {
  # ... Other parts of your configuration ...
  programs.neovim = {
    enable = true;

    # Often required; don't worry as they are isolated in Neovim environment
    withPython3 = true;
    withNodeJs = true;

    # Packages available within Neovim during runtime. Put your LSP Servers, formatters, linters, etc.
    extraPackages = with pkgs; [
      bash-language-server
      buf
      # clang provides both LSP Server for C/C++ and a C compiler for treesitter parsers
      clang
      lua-language-server
      stylua
      gopls
      lua51Packages.lua
      lua51Packages.luarocks-nix
      nixpkgs-fmt
      go-tools
      rust-analyzer
      dockerfile-language-server-nodejs
      vscode-langservers-extracted
      nixd
      nil
      prettierd
      eslint
      yaml-language-server
      terraform-ls
      ruff
      basedpyright
      tree-sitter
    ];
  };

  # Symlink your Neovim configuration (or delete the line to manage .config/nvim directly)
  xdg.configFile = {
    "nvim" = {
      source = ../../configurations/nvim;
      recursive = true;
    };
  };

  # Tools available during activation
  home.extraActivationPath = with pkgs; [
    git
    gnumake
    gcc
    config.programs.neovim.finalPackage
    # The package above is preferred, but if you can't make it work, use this instead:
    # neovim
  ];

  # Activation script to set up Neovim plugins
  home.activation.updateNeovimState = lib.hm.dag.entryAfter ["writeBoundary"] ''
    args=""
    if [[ -z "''${VERBOSE+x}" ]]; then
      args="--quiet"
    fi
    run $args nvim --headless '+Lazy! restore' +qa
  '';

  # ... Other parts of your configuration ...
}
