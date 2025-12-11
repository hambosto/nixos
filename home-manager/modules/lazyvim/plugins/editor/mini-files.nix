{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.mini-files;
in
{
  options.programs.lazyvim.mini-files = {
    enable = mkEnableOption "Mini files explorer";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.editor.mini-files" ];
      extraPlugins = with pkgs.vimPlugins; [
        {
          name = "mini.files";
          path = mini-nvim;
        }
      ];
    };
  };
}
