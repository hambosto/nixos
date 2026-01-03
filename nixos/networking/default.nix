{
  networking.hostName = "vivobook-m1403qa";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.enable = false;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    General.AddressRandomization = "once";
    General.AddressRandomizationRange = "full";
    Settings.AutoConnect = true;
  };
}
