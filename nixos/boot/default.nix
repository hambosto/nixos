{
  pkgs,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    kernel.sysctl = {
      "kernel.core_pattern" = "|/bin/false";
      "fs.suid_dumpable" = 0;
    };
    tmp.cleanOnBoot = true;
  };
}
