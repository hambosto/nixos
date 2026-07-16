{
  services.zram-generator = {
    enable = true;
    settings = {
      zram0 = {
        compression-algorithm = "zstd";
      };
    };
  };
}
