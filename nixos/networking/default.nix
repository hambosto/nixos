{
  # Hostname configuration
  networking.hostName = "vivobook-m1403qa";

  # NetworkManager configuration
  networking.networkmanager.enable = true;

  networking.networkmanager.wifi.macAddress = "random";
  networking.networkmanager.wifi.scanRandMacAddress = true;
}
