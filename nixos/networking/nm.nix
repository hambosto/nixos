{
  networking.networkmanager.enable = true;
  networking.networkmanager.unmanaged = [
    "lo"
    "docker0"
    "virbr0"
  ];
  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.wifi.powersave = false;
}
