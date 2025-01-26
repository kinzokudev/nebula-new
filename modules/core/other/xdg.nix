{
  lib,
  pkgs,
  ...
}: {
  xdg.portal = {
    enable = true;
    wlr = lib.mkForce {enable = false;};
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
  };
}
