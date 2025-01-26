{
  inputs,
  config,
  hostname,
  ...
}: let
  resolution =
    if (hostname == "NOVA")
    then "1920x1080"
    else if (hostname == "TEMPEST")
    then "1920x1080"
    else if (hostname == "SATELLITE")
    then "1280x800"
    else "1920x1080";
in {
  imports = [
    inputs.minegrub-theme.nixosModules.default
  ];
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        devices = ["nodev"];
        gfxmodeEfi = "${resolution}";
        minegrub-theme = {
          enable = true;
          splash = "Also try ULTRAKILL!";
          background = "background_options/1.8  - [Classic Minecraft].png";
          boot-options-count = 4;
        };
      };
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}
