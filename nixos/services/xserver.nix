{
  lib,
  pkgs,
  ...
}:
{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.displayManager.lightdm.enable = lib.mkForce false;
}
