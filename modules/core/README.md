Here you might see a ``default.nix`` file and you might be confused.
Here is the explanation for why there is one here.

Inside ``flake.nix`` we imported (basically told it to look inside the specified folder) ``./modules``, and when we did that, it went inside of the ``modules`` folder, and looked for a ``default.nix`` file (This is basic nix behaviour, and you will utilize it when creating new modules inside folders and such as time goes on) Afterwards, the ``default.nix`` inside the ``modules`` folder file imported the ``home-manager`` and ``core`` folders, so it looked for a ``default.nix`` in both of them, which is where you are right now.

This file
