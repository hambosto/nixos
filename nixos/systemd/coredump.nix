{
  systemd.coredump = {
    enable = false;
    settings = {
      Coredump = {
        Storage = "none";
        ProcessSizeMax = 0;
      };
    };
  };
}
