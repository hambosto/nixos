{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
    ];

    fontconfig = {
      enable = true;

      hinting = {
        enable = true;
        style = "slight";
        autohint = false;
      };

      antialias = true;

      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
  };
}
