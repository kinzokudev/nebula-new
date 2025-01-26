{
  pkgs,
  lib,
  ...
}: {
  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-frappe";
        package = lib.mkForce pkgs.kdePackages.sddm;
      };
    };
    xserver = {
      displayManager = {
        lightdm.enable = false;
      };
    };
  };
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      font = "JetBrainsMono Nerd Font";
      fontSize = "15";
      background = "${../../../assets/wallpapers/dmc5-vergil-yamato.jpg}";
      loginBackground = true;
    })
  ];
}
