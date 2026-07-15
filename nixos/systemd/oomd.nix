{
  systemd.oomd = {
    enable = true;
    enableRootSlice = true;
    enableUserSlices = true;
    enableSystemSlice = true;
    settings.OOM = {
      DefaultMemoryPressureDurationSec = "20s";
    };
  };
}
