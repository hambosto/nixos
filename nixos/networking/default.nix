{
  # Hostname configuration
  networking.hostName = "vivobook-m1403qa";

  # DHCP configuration
  networking.useDHCP = false;

  # Firewall configuration
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # DNS nameservers
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];

  # NetworkManager configuration
  networking.networkmanager.enable = true;

  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.wifi.powersave = false;

  # IWD (Intel Wireless Daemon) configuration
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    Network.EnableIPv6 = true;
    Settings.AutoConnect = true;
    General.AddressRandomization = "once";
    General.AddressRandomizationRange = "full";
  };
}
