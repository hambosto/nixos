{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.mini-animate;
in
{
  options.programs.lazyvim.mini-animate = {
    enable = mkEnableOption "Mini animate";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.ui.mini-animate" ];
      extraPlugins = with pkgs.vimPlugins; [
        {
          name = "mini.animate";
          path = mini-nvim;
        }
      ];
    };
  };
}
