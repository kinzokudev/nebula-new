{
  lib,
  hostname,
  ...
}: {
  imports =
    [
      ./blueman.nix
      ./graphics.nix
      ./steam.nix
    ]
    ++ (lib.lists.optionals (hostname == "NOVA") [
      ./hyprland.nix
      ./sddm.nix
      ./kde6.nix
    ])
    ++ (lib.lists.optionals (hostname == "TEMPEST") [
      ./hyprland.nix
      ./sddm.nix
      ./kde6.nix
    ])
    ++ (lib.lists.optionals (hostname == "SATELLITE") [
      ./kde6.nix
    ]);
}
