{
  config,
  ...
}:
{
  services.batsignal = {
    enable = config.programs.waybar.enable;
    extraArgs = [
      "-c"
      "20"
      "-f"
      "100"
    ];
  };
}
