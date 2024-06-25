{...}: {
  home.file = {
    ".config/hypr" = {
      source = ../../configurations/hypr;
      recursive = true;
    };
    ".config/waybar" = {
      source = ../../configurations/waybar;
      recursive = true;
    };
    ".config/wofi" = {
      source = ../../configurations/wofi;
      recursive = true;
    };
  };
}
