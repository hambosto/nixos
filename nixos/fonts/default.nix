{
  pkgs,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
    ];

    enableDefaultPackages = false;

    fontconfig = {
      antialias = true;
      hinting.enable = true;
      subpixel.lcdfilter = "default";
      subpixel.rgba = "rgb";
    };
  };
}
