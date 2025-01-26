{
  inputs,
  config,
  lib,
  userinfo,
  isServer,
  hostname,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModule
  ];
  boot.tmp.cleanOnBoot = true;
  environment.persistence = {
    "/persist" = {
      files = [
        "/etc/machine-id"
      ];
      directories =
        if isServer
        then [
          "/var/log"
          "/var/lib/systemd/coredump"
          "/etc/NetworkManager/system-connections"
          "/etc/mullvad-vpn"
          "/etc/backups"
          "/etc/cred"
          "/var/lib/nixos-containers"
          "/var/lib/nixos"
          "/etc/nixos-containers"
        ]
        else
          [
            "/var/log"
            "/var/lib/bluetooth"
            "/var/lib/systemd/coredump"
            "/etc/NetworkManager/system-connections"
            "/var/lib/flatpak"
            "/var/lib/waydroid"
            "/etc/mullvad-vpn"
            "/etc/cosmic-comp"
            "/var/lib/nixos"
          ]
          ++ (lib.lists.optionals (hostname == "SATELLITE") [
            "/var/lib/decky-loader"
          ]);
      users.${userinfo.name} = {
        directories =
          if isServer
          then [
            ".config/Mullvad VPN"
            ".config/sops"
            ".local/state/syncthing"
            ".local/share/Steam"
            "Backups"
            ".ssh"
            "NixOS"
          ]
          else [
            ".config/Ryujinx"
            ".config/dolphin-emu"
            ".config/melonDS"
            ".config/PCSX2"
            ".config/Cemu"
            ".config/spotify"
            ".config/gzdoom"
            ".config/ags"
            ".config/rpcs3"
            ".config/r2modman"
            ".config/r2modmanPlus-local"
            ".config/sops"
            ".config/quickshell"
            ".config/vesktop"
            ".config/Vencord"
            ".config/StardewValley"
            ".config/VA_11_Hall_A"
            ".config/nuclearthrone"
            ".config/Signal Beta"
            ".config/Signal"
            ".config/noisetorch"
            ".config/Mullvad VPN"
            ".config/nheko"
            ".config/obs-studio"
            ".config/steam-rom-manager"
            ".config/cosmic"
            ".config/deadbolt_game"
            ".config/obsidian"
            ".config/flameshot"
            ".config/heroic"
            ".config/Vampire_Survivors"
            ".config/Vampire_Survivors_Data"
            ".config/Vampire_Survivors_97277776"
            ".config/libreoffice"
            ".config/celeste"
            ".config/Element"
            ".config/discord"
            ".config/nemo"
            ".config/PreMiD"
            ".config/discordcanary"
            ".config/electron-mail"
            ".config/MangoHud"
            ".config/nwg-panel"
            ".config/nwg-dock"
            ".config/steamtinkerlaunch"
            ".local/share/dolphin-emu"
            ".local/share/dolphin"
            ".local/share/bottles"
            ".local/state/syncthing"
            ".local/state/wireplumber"
            ".local/share/nheko"
            ".local/share/lutris"
            ".local/share/applications"
            ".local/share/Danganronpa2"
            ".local/share/StardewValley"
            ".local/share/duckstation"
            ".local/share/Steam"
            ".local/share/vinegar"
            ".local/share/citra-emu"
            ".local/share/Cemu"
            ".local/share/flatpak"
            ".local/share/PrismLauncher"
            ".local/share/PollyMC"
            ".local/share/HotlineMiami2"
            ".local/share/HotlineMiami"
            ".local/share/Celeste"
            ".local/share/NexusMods.App"
            ".local/share/waydroid"
            ".local/share/komikku"
            ".local/share/anime-games-launcher"
            ".local/share/sleepy-launcher"
            ".local/share/gvfs-metadata"
            ".local/share/Terraria"
            ".local/share/DaVinciResolve"
            ".local/share/Smart Code ltd"
            ".local/share/nemo"
            ".local/share/nvf"
            ".local/share/vulkan"
            ".local/share/osu"
            ".cache/waydroid_script"
            ".ssh"
            ".klei"
            ".thunderbird"
            ".wine"
            ".var"
            ".steam"
            ".ftba"
            ".minecraft"
            ".stremio-server"
            ".mozilla"
            ".floorp"
            ".mullvad"
            ".factorio"
            ".zplug"
            ".android"
            "Backups"
            "Downloads"
            "Desktop"
            "Documents"
            "Audio"
            "Images"
            "Video"

            ## KDE Related stuff
            ## KDE Team why are you like this
            ".config/KDE"
            ".config/kde.org"
            ".config/plasma-workspace"
            ".config/xsettingsd"
            ".kde"
          ];
        files = [
          ".gtkrc-2.0"
          ".zsh_history"
          ".config/gtk-3.0/bookmarks"
          ## Mane wtf is wrong wit u KDE Plasma team
          ".config/akregatorrc"
          ".config/baloofileinformationrc"
          ".config/baloofilerc"
          ".config/bluedevilglobalrc"
          ".config/device_automounter_kcmrc"
          ".config/dolphinrc"
          ".config/filetypesrc"
          ".config/gtkrc"
          ".config/gtkrc-2.0"
          ".config/gwenviewrc"
          ".config/kactivitymanagerd-pluginsrc"
          ".config/kactivitymanagerd-statsrc"
          ".config/kactivitymanagerd-switcher"
          ".config/kactivitymanagerdrc"
          ".config/katemetainfos"
          ".config/katerc"
          ".config/kateschemarc"
          ".config/katevirc"
          ".config/kcmfonts"
          ".config/kcminputrc"
          ".config/kconf_updaterc"
          ".config/kded5rc"
          ".config/kdeglobals"
          ".config/kgammarc"
          ".config/kglobalshortcutsrc"
          ".config/khotkeysrc"
          ".config/kmixrc"
          ".config/konsolerc"
          ".config/kscreenlockerrc"
          ".config/ksmserverrc"
          ".config/ksplashrc"
          ".config/ktimezonedrc"
          ".config/kwinrc"
          ".config/kwinrulesrc"
          ".config/kxkbrc"
          ".config/partitionmanagerrc"
          ".config/plasma-localerc"
          ".config/plasma-nm"
          ".config/plasma-org.kde.plasma.desktop-appletsrc"
          ".config/plasmanotifyrc"
          ".config/plasmarc"
          ".config/plasmashellrc"
          ".config/PlasmaUserFeedback"
          ".config/plasmawindowed-appletsrc"
          ".config/plasmawindowedrc"
          ".config/powermanagementprofilesrc"
          ".config/spectaclerc"
          ".config/startkderc"
          ".config/systemsettingsrc"
          ".config/Trolltech.conf"
          ".config/user-dirs.dirs"
          ".config/user-dirs.locale"

          ".local/share/krunnerstaterc"
          ".local/share/user-places.xbel"
          ".local/share/user-places.xbel.bak"
          ".local/share/user-places.xbel.tbcache"
        ];
      };
    };
  };
  fileSystems = {
    "/" = lib.mkForce {
      device = "tmpfs";
      fsType = "tmpfs";
      neededForBoot = true;
      options = [
        "defaults"
        "size=5G"
        "mode=755"
      ];
    };
    "/home/${userinfo.name}" = lib.mkForce {
      device = "tmpfs";
      fsType = "tmpfs";
      neededForBoot = true;
      options = [
        "defaults"
        "size=5G"
        "mode=777"
      ];
    };
    "/persist".neededForBoot = true;
    "/persist/cache".neededForBoot = true;
  };
  users.users = {
    ${userinfo.name} = {
      hashedPasswordFile = "/persist/passwords/user";
      initialPassword = "nutsitch";
    };
    root = {
      hashedPasswordFile = "/persist/passwords/root";
      initialPassword = "ballsitch";
    };
    # echo abcdef | mkpasswd -s
  };
}
