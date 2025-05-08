{
  pkgs,
  ...
}:
{
  boot = {
    kernel.sysctl = {
      "kernel.core_pattern" = "|/bin/false";
      "fs.suid_dumpable" = 0;
    };
    kernelPackages = pkgs.linuxPackages_cachyos-rc;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    tmp.cleanOnBoot = true;
  };
}
