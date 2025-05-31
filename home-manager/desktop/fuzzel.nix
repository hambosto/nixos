{
  lib,
  pkgs,
  ...
}:
{
  programs.fuzzel = {
    enable = false;
    settings = {
      main = {
        font = lib.mkForce "Ubuntu Nerd Font:size=12";
        terminal = "${lib.getExe pkgs.kitty} -e";
        layer = "overlay";
        icon-theme = "Papirus";
        password-character = "*";
        width = 40;
        lines = 10;
        line-height = 25;
        icons-enabled = true;
        use-bold = true;
        horizontal-pad = 20;
        vertical-pad = 10;
        inner-pad = 6;
        dpi-aware = false;
      };
      border = {
        width = 2;
        radius = 15;
      };
    };
  };
}
