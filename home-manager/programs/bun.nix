{
  programs.bun = {
    enable = false;
    settings = {
      telemetry = false;
      install.cache = {
        disable = false;
        disableManifest = false;
      };
    };
  };
}
