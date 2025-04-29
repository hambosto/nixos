{
  config,
  ...
}:
{
  virtualisation.spiceUSBRedirection.enable = config.virtualisation.libvirtd.enable;
}
