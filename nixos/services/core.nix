{
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.dbus.enable = true;
  services.gvfs.enable = true;
  services.fstrim.enable = true;
  services.gnome.gnome-keyring.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;
}
