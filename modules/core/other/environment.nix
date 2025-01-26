{
  config,
  userinfo,
  ...
}: {
  environment.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    GTK_THEME = "${config.home-manager.users.${userinfo.name}.gtk.theme.name}";
    MOZ_ENABLE_WAYLAND = "1";
    RUST_BACKTRACE = "1";
    QT_QPA_PLATFORMTHEME = "${config.home-manager.users.${userinfo.name}.qt.platformTheme.name}";
    EDITOR = "nvim";
    XCURSOR_THEME = "${config.home-manager.users.${userinfo.name}.home.pointerCursor.name}";
    XCURSOR_SIZE = config.home-manager.users.${userinfo.name}.home.pointerCursor.size;
    NIXOS_OZONE_WL = 1;
    WLR_DRM_NO_ATOMIC = 0;
  };
}
