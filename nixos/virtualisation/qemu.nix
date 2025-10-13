{
  virtualisation.libvirtd = {
    enable = false;
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
}
