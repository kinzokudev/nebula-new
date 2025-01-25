{
  imports = [
    # insert imports here
    # example:
    # ./spicetify.nix
    # ./prism.nix
  ];
  home = {
    #This option defines the first version of NixOS you have installed on this particular machine, and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    # You don't need to change this value after updating, It's just gotta match a real NixOS
    stateVersion = "24.05";
  };
}
