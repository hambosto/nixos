{
  lib,
  ...
}:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "TTY";
      theme_background = false;
    };
  };
}
