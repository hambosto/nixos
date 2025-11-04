{
  services.zram-generator = {
    enable = true;
    settings = {
      zram0 = {
        compression-algorithm = "zstd";
        swap-priority = 5;
        zram-size = "min(ram / 2, 4096)";
      };
    };
  };
}
