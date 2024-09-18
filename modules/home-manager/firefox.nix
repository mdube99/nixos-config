{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.mark = {
      # userChrome = builtins.readFile ../../configurations/firefox/userChrome.css;
      # userContent = builtins.readFile ../../configurations/firefox/userContent.css;
      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };
      };
      search.force = true;

      bookmarks = [
        {
          name = "wikipedia";
          tags = ["wiki"];
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        }
      ];

      settings = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        # For Firefox GNOME theme:
        # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enabled" = true;

        "browser.startup.homepage" = "about:home";
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = true;
        "signon.rememberSignons" = false;
        "security.tls.version.min" = "1";
        "browser.fullscreen.autohide" = false;
        "full-screen-api.ignore-widgets" = true;
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        darkreader
        foxyproxy-standard
        multi-account-containers
      ];
    };
  };
}
