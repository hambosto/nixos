{ lib, pkgs, ... }:
{
  services = {
    dbus.enable = true;
    dbus.packages = [ pkgs.nautilus ];
    fstrim.enable = true;
    gnome.gnome-keyring.enable = lib.mkForce false;
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  systemd.user.services.niri-flake-polkit.enable = false;
}
