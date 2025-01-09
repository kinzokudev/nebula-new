{
  description = "me when the flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # change this to "nixpkgs.url" if you wish to use unstable as your main channel instead
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # you can add more inputs here for them to provide packages, options and etc.
    # the syntax is usually <program-name>.url = "github:<repo-owner>:<repo-name>
    # you can additionally make it so that the url you provide follows the nixpkgs input above, but some programs may not play well with this. (Though it is rare)
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: {
    # Replace "HOSTNAMEGOESHERE with your hostname.
    # You can make it whatever you want if you are planning to install nixos using your configuration
    # you write before installation. Otherwise, use your already existing hostname.
    nixosConfigurations.HOSTNAMEGOESHERE = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts
        ./modules
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
