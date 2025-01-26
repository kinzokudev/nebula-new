{
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (pkgs) callPackage;
in {
  houston = callPackage ./houston {};
}
