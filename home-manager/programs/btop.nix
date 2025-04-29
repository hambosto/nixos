{
  lib,
  ...
}:
{
  programs.btop = {
    enable = false;
    settings = {
      color_theme = lib.mkForce "TTY";
      theme_background = false;
    };
  };
}
