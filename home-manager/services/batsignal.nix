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
      "-w"
      "30"
      "-f"
      "100"
    ];
  };
}
