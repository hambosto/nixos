{
  pkgs,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.ubuntu
      cascadia-code
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
