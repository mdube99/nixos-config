{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
    programs.git = {
      enable = true;
      package = pkgs.unstable.git;
      delta.enable = true;
      delta.options = {
        line-numbers = true;
        side-by-side = true;
        navigate = true;
      };
      userEmail = "mjdube99@gmail.com";
      userName = "mdube99";
    };
}
