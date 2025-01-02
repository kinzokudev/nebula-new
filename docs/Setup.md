# Inital setup (for the configuration to properly eval)

Alright, here we go.
I will be referencing files by name, assuming you have the repo's page open on another tab or window.

(NOTE: You need to substitute the path to where you put your configuration instead of `${the/path/to/wherever/you/put/your/config}` for all the instructions below.)

Firstly, go to the `flake.nix` file, and go to line 24 (or whichever line has `HOSTNAMEGOESHERE`) and change it to your host's current name (If you have already set up NixOS without flakes) or change it your desired hostname if you are setting your system up from scratch. (Essentially, If you are going to reinstall NixOS with this configuration after writing your configuration. Most likely not what you are doing.)

Secondly, If you have a configuration at `/etc/nixos/`, copy it over to `${the/path/to/wherever/you/put/your/config}/hosts/myAwesomeHost`. If you dont have an auto-generated configuration (for whatever reason), run `sudo nixos-generate-config` in your terminal and refer to the previous sentence.

Thirdly, go to `${the/path/to/wherever/you/put/your/config}/modules/default.nix` and edit it and find where it says `YOURUSERNAMEGOESHERE` and replace it with your username.

Once you're done, run the command to switch to your new configuration. It should look like this.

`sudo nixos-rebuild switch --flake ${the/path/to/wherever/you/put/your/config}`

You will have to run this command each time you modify your config. Think of it like an apply button.

If you don't want to commit to it, you can test your configuration with

`sudo nixos-rebuild test --flake ${the/path/to/wherever/you/put/your/config}`

After running this, to get back to your old configuration, just restart.
