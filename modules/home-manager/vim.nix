{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.vim = {
    enable = true;
      extraConfig = ''
        set hidden
        set ts=4 sw=4
        set colorcolumn=80
        set relativenumber number
      '';
    };
}
