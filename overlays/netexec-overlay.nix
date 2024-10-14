{ pkgs ? import <nixpkgs> {} }:

let
  python = pkgs.python3.override {
    self = python;
    packageOverrides = self: super: {
      impacket = super.impacket.overridePythonAttrs {
        version = "0.12.0.dev1-unstable-2023-11-30";
        src = pkgs.fetchFromGitHub {
          owner = "Pennyw0rth";
          repo = "impacket";
          rev = "d370e6359a410063b2c9c68f6572c3b5fb178a38";
          hash = "sha256-Jozn4lKAnLQ2I53+bx0mFY++OH5P4KyqVmrS5XJUY3E=";
        };
        # Fix version to be compliant with Python packaging rules
        postPatch = ''
          substituteInPlace setup.py \
            --replace 'version="{}.{}.{}.{}{}"' 'version="{}.{}.{}"'
        '';
      };
    };
  };

in {
  netexec-overlay = self: super: {
    netexec = pkgs.buildPythonApplication {
      pname = "netexec";
      version = "1.1.0-unstable-2024-01-15";
      pyproject = true;
      pythonRelaxDeps = true;
      pythonRemoveDeps = [
        # Fail to detect dev version requirement
        "neo4j"
      ];

      src = pkgs.fetchFromGitHub {
        owner = "Pennyw0rth";
        repo = "NetExec";
        rev = "9df72e2f68b914dfdbd75b095dd8f577e992615f";
        hash = "sha256-oQHtTE5hdlxHX4uc412VfNUrN0UHVbwI0Mm9kmJpNW4=";
      };

      postPatch = ''
        substituteInPlace pyproject.toml \
          --replace '{ git = "https://github.com/Pennyw0rth/impacket.git", branch = "gkdi" }' '"*"' \
          --replace '{ git = "https://github.com/Pennyw0rth/oscrypto" }' '"*"'
      '';

      buildInputs = [ python ];

      meta = {
        description = "A package that provides the netexec application";
      };
    };

    # Add other packages as needed
  };
}
