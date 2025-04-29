{
  services.resolved = {
    enable = true;
    dnssec = "true";
    dnsovertls = "true";
    domains = [ "~." ];
    fallbackDns = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}
