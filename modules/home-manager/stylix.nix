{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../../configurations/wallpapers/interstellar_black_hole.png;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark-terminal.yaml";
    imageScalingMode = "center";
    targets.xresources.enable = true;

    polarity = "dark"; # “light” or “either”
    # polarity = "light"; # “light” or “either”

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
