{
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.wallpaper-rs.homeManagerModules.default ];

  services.wallpaper-rs = {
    enable = true;
    image = config.stylix.image;
  };
}
