{
  lib,
  pkgs,
  ...
}: {
  getSSHpubkeys = username: builtins.readFile (builtins.fetchurl "https://github.com/${username}.keys");
}
