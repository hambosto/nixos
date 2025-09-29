{ pkgs, ... }:
{
  virtualisation.libvirtd.enable = false;
  virtualisation.libvirtd.qemu.runAsRoot = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [
    (pkgs.OVMFFull.override {
      secureBoot = true;
      tpmSupport = true;
    }).fd
  ];
}
