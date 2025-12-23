{ pkgs, ... }:
{
  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.nautilus ];
    };
    fstrim.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  systemd.user.services.niri-flake-polkit.enable = false;
}
