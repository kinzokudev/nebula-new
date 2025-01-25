{
  description = "me when the flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko.url = "github:ardishko/disko";
    impermanence = {
      url = "github:nix-community/impermanence";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
    hyprcontrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    xdg-desktop-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "hyprland";
    };
    hy3 = {
      url = "github:outfoxxed/hy3";
      # or "github:outfoxxed/hy3?ref=hl{version}" for a release version of hyprland
      inputs.hyprland.follows = "hyprland";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "hyprland";
    };
    pyprland = {
      url = "github:hyprland-community/pyprland";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.1.0";

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs"; # override this repo's nixpkgs snapshot
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
    };

    shadower = {
      url = "github:n3oney/shadower";
    };
    wayfreeze = {
      url = "github:jappie3/wayfreeze";
    };
    watershot = {
      url = "github:Kirottu/watershot";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
    };

    tag-studio = {
      url = "github:TagStudioDev/TagStudio";
    };

    ags = {
      url = "github:Aylur/ags";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
    };

    dolphin-emu = {
      url = "github:MatthewCroughan/dolphin-emu-nix";
    };

    polly-mc = {
      url = "github:fn2006/PollyMC";
    };

    flux = {
      url = "github:IogaMaster/flux";
    };

    nvf.url = "github:notashelf/nvf";

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-topology.url = "github:oddlama/nix-topology";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv.url = "github:cachix/devenv";

    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      systems,
      treefmt-nix,
      ...
    }:
    let
      lib = nixpkgs.lib // home-manager.lib;

      userinfo = {
        name = "kinzoku";
        email = "kinzoku@the-nebula.xyz";
        altemail = "kinzokudev4869@gmail.com";
        handles = {
          github = "kinzokudev";
          discord = "kinzokudev";
          reddit = "kinzokudev";
          twitter = "kinzokudev";
          bluesky = "kinzokudev";
        };
      };

      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);

      mkHost =
        {
          system,
          hostname,
          isServer,
        }:
        (lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              hostname
              isServer
              userinfo
              ;
          };
          modules = [
            ./hosts/${builtins.toLower hostname}
            ./modules
            home-manager.nixosModules.home-manager
          ];
        });
    in
    {
      devShells."x86_64-linux".default = import ./devshell.nix {
        inherit inputs;
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };

      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);

      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });

      nixosConfigurations = {
        nova = mkHost {
          system = "x86_64-linux";
          hostname = "NOVA";
          isServer = false;
        };
        tempest = mkHost {
          system = "x86_64-linux";
          hostname = "TEMPEST";
          isServer = false;
        };
        satellite = mkHost {
          system = "x86_64-linux";
          hostname = "SATELLITE";
          isServer = false;
        };
        andromeda = mkHost {
          system = "x86_64-linux";
          hostname = "ANDROMEDA";
          isServer = true;
        };
      };
    };
}
