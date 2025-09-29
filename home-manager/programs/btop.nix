{ lib, ... }:
{
  programs.btop = {
    enable = false;
    settings = {
      color_theme = lib.mkForce "TTY";
      proc_tree = true;
      theme_background = false;
    };
  };
}
