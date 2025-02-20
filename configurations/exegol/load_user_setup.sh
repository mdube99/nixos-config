#!/bin/bash
set -e

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.

# Install nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes
sed -i 's/pwn3d_label = Pwn3d!/pwn3d_label = (Admin Access)/' ~/.nxc/nxc.conf
git clone https://github.com/santoru/shcheck /opt/tools/shcheck
git clone https://github.com/mdube99/custom-nuclei-templates /opt/tools/custom-nuclei-templates
git clone https://github.com/mdube99/shrawler /opt/tools/shrawler
git clone https://github.com/mdube99/ldapenum /opt/tools/ldapenum
git clone https://github.com/nyxgeek/onedrive_user_enum.git /opt/tools/onedrive_user_enum
git clone https://github.com/insidetrust/statistically-likely-usernames /usr/share/wordlists/statistically-likely-usernames
pip install git+https://github.com/blacklanternsecurity/trevorproxy
pip install git+https://github.com/blacklanternsecurity/trevorspray
