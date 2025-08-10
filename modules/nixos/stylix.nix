{pkgs, ...}: {
  stylix = {
    image = ../../configurations/wallpapers/interstellar_black_hole.png;
    imageScalingMode = "center";
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark-terminal.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    fonts.sizes.applications = 14;
    fonts.sizes.popups = 12;

    # polarity = "dark"; # “light” or “either”
    # cursor.package = pkgs.bibata-cursors;
    # cursor.name = "Bibata-Modern-Ice";
  };
}
