{pkgs, ...}: {
  stylix = {
    image = ../../configurations/wallpapers/facet.jpg;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";

    # polarity = "dark"; # “light” or “either”
    # cursor.package = pkgs.bibata-cursors;
    # cursor.name = "Bibata-Modern-Ice";
  };
}
