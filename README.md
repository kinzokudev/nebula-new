# smplntplate
a simple nixos configuration template for easier migration to flakes

This configuration will not work, as it's just a template to make migrating to flakes easier.

You can copy your ``hardware-configuration.nix`` and ``configuration.nix`` If you have already generated those 2 during installation.

Your nixos related configurations should go in ``/modules/core`` and your home-manager related configurations should go in ``/modules/home-manager``.
You are free to organize them however you want. In addition, any required tasks to get stuff working are in the relevant directories as markdown files that you can read.
