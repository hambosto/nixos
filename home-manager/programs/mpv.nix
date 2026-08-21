{
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu-next";
      gpu-api = "vulkan";
      hwdec = "auto-safe";
      profile = "high-quality";

      save-position-on-quit = "no";
      resume-playback = "no";
      icc-cache = "no";
      gpu-shader-cache = "no";
      cache-on-disk = "no";

      target-colorspace-hint = "no";
    };
  };
}
