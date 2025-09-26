{ lib, ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "TTY";
      proc_tree = true;
      theme_background = false;
    };
  };
}
