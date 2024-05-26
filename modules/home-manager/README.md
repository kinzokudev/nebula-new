Here you might see a default.nix file and you might be confused.
Here is the explanation for why there is one here.

Inside ``flake.nix`` we imported (basically told it to look inside the specified folder) ``./modules``. 

When we did that, it went inside of the ``modules`` folder and looked for a ``default.nix`` file (This is basic nix behaviour. When you import a file, It will look for a ``default.nix`` file inside of said folder.) 

Afterwards, the ``default.nix`` inside the ``modules`` folder file imported the ``home-manager`` and ``core`` folders, so it looked for a ``default.nix`` in both of them, which is where you are right now.

The folder you are in right now is for managing home-manager related configurations. You can organize it however you want.

To create a module, first start with creating a file named 
