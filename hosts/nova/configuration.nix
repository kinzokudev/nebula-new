# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  options,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  networking = {
    hostId = "619b589f";
    hosts = {
      "::1" = [
        "localhost"
        "nova"
      ];
      "127.0.0.1" = [ "localhost" ];
      "127.0.0.2" = [ "nova" ];
    };
    interfaces."eno1" = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.40.10";
          prefixLength = 17;
        }
      ];
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  user.extraGroups = [ "dialout" ];
  services = {
    # Configure keymap in X11
    xserver = {
      layout = "us";
      xkbVariant = "";
    };

    webdav.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
    ];
  };
}
