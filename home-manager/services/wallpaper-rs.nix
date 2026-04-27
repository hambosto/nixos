{
  inputs,
  config,
  ...
}:
{
  services.wallpaper-rs = {
    enable = true;
    image = config.stylix.image;
  };
}
