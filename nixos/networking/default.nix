{
  networking.hostName = "vivobook-m1403qa";
  networking.useNetworkd = true;
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General = {
        AddressRandomization = "once";
        AddressRandomizationRange = "full";
      };
      Network.EnableIPv6 = true;
      Settings.AutoConnect = true;
    };
  };
}
