{
  lib,
  hostname,
  ...
}: {
  imports = [
    ./dconf.nix
    ./environment.nix
    ./impermanence.nix
    ./jovian.nix
    ./locales.nix
    ./nix-ld.nix
    ./nix.nix
    ./nixpkgs.nix
    ./polkit.nix
    ./security.nix
    ./users.nix
    ./virtualization.nix
    ./xdg.nix
  ];
}
