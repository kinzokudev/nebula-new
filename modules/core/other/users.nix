{
  pkgs,
  config,
  userinfo,
  ...
}: {
  users.users.${userinfo.name} = {
    isNormalUser = true;
    description = "${userinfo.name}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
