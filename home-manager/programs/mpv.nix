{
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu-next";
      interpolation = true;
      tscale = "oversample";
      video-sync = "display-resample";
    };
  };
}
