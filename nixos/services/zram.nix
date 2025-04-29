{
  services.zram-generator = {
    enable = true;
    settings = {
      zram0 = {
        zram-size = "min(ram / 2, 4096)";
      };
    };
  };
}
