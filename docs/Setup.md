# Inital setup (for the configuration to properly eval)

Alright, here we go.
I will be referencing files by name, assuming you have the repo's page open on another tab or window.

Firstly, go to the `flake.nix` file, and go to line 24 (or whichever line has `HOSTNAMEGOESHERE`) and change it to your host's current name (If you have already set up NixOS without flakes) or change it your desired hostname if you are setting your system up from scratch. (Essentially, If you are going to reinstall NixOS with this configuration after writing your configuration. Most likely not what you are doing.)

Secondly, If you have a configuration at `/etc/nixos/`, copy it over to `/hosts/myAwesomeHost`. If you dont have an auto-generated configuration (for whatever reason), run `sudo nixos-generate-config` in your terminal and refer to the previous sentence.
