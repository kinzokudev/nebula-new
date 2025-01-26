{
  inputs,
  userinfo,
  ...
}: {
  imports = [
    inputs.jovian-nixos.nixosModules.default
  ];

  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      user = "${userinfo.name}";
      desktopSession = "plasma";
    };
    devices = {
      steamdeck = {
        enable = true;
        enableGyroDsuService = true;
      };
    };
    decky-loader = {
      enable = true;
      user = "${userinfo.name}";
      stateDir = "/var/lib/decky-loader";
    };
    steamos = {
      useSteamOSConfig = true;
    };
  };
}
