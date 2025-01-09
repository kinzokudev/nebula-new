# What is this?

SMPL (pronounced **S**i**MPL**e) is a NixOS configuration template deriving from own personal configuration, which aims to be as organized as possible while not forcing users to abstract everything from the get-go.

This template is not the EXACT same as my configuration for accessibility reasons.

# What do I provide?

What this template provides is a general structure to get you started on configuring NixOS with flakes. 

in the `docs/` folder, you can find guides on the following (not in any particular order):

- 1. How to migrate your existing NixOS setup without flakes, to this template. (Or how to generate a configuration, if you are doing this in the installer. Preferably, dont do that though. [You might run into this issue.](https://github.com/NixOS/nixpkgs/issues/85148))
- 2. What to edit and change during the migration.
- 3. The various ways you can organize this configuration after the setup.
- 4. Centralization (If this repo ever becomes popular, that is.)

If you're looking for the setup guide, it's [here](https://github.com/ardishko/SMPL/blob/master/docs/Setup.md)

# Clarifications

- This project is open to suggestions. Feel free to open issues or PRs If you think something is missing. Don't be shy, I don't bite :)

- DO NOT EDIT FILES WITH SUDO ONCE YOU HAVE SET THIS UP, THEY WILL BE READ ONLY AND IT CAN PRODUCE UNEXPECTED RESULTS, DON'T OPEN ISSUES ABOUT THIS!

- If it says "`/nix/store/lkjsxjnsjdkgljkasjg-somestupidhashhere/somefile.nix` not found" then you can either run `git add .` or you can just delete the `.git` folder with (assuming you're inside the directory where you put your config) `rm -r .git`. I recommend the latter if you don't know what you're doing with `git`.
