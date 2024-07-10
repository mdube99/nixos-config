{
  inputs,
  lib,
  ...
}: let
  nixvim' = inputs.nixvim.packages."x86_64-linux".default;
  nvim = nixvim';
in {
  home.packages = [
    nvim
  ];

  # programs.neovim.enable = true;
  # programs.neovim.package = nvim;
}
