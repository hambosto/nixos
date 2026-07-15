{
  services.zram-generator = {
    enable = true;
    settings = {
      zram0 = {
        compression-algorithm = "lz4";
        zram-size = "50 / 100 * ram";
        swap-priority = 100;
      };
    };
  };
}
