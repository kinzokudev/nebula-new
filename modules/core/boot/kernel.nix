{
  pkgs,
  hostname,
  config,
  lib,
  isServer,
  ...
}: {
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 1;
    kernelParams = [
      "split_lock_detect=off"
      "quiet"
    ];

    extraModulePackages = with config.boot.kernelPackages; (lib.lists.optionals (hostname == "NOVA") [
      xpadneo
      usbip
    ]);
    kernelPackages =
      if (hostname == "SATELLITE")
      then pkgs.linuxPackages_jovian
      else if isServer
      then pkgs.linuxPackages_hardened
      else pkgs.linuxPackages;
    supportedFilesystems = [
      "ntfs"
      "zfs"
    ];
    kernelModules = [
      "udev"
      "xpadneo"
      "hid-nintendo"
    ];
  };
  hardware.uinput.enable = true;
}
