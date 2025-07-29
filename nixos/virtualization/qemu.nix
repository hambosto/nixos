{
  pkgs,
  ...
}:
{
  virtualisation.libvirtd = {
    enable = false;
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMFFull.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };
}
