{
  config,
  ...
}:
{
  programs.virt-manager.enable = config.virtualisation.libvirtd.enable;
}
