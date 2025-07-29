{
  lib,
  pkgs,
  ...
}:
{
  boot = {
    bootspec.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = lib.mkForce false;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    tmp.cleanOnBoot = true;
  };
}
