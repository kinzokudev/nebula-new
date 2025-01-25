{
  inputs,
  outputs,
  userinfo,
  hostname,
  isServer,
  ...
}: {
  imports = [
    ./core
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        outputs
        userinfo
        hostname
        isServer
        ;
    };
    useGlobalPkgs = false;
    useUserPackages = true;
    users = {
      # Import your home-manager configuration
      ${userinfo.name} = import ./home-manager;
    };
  };
}
