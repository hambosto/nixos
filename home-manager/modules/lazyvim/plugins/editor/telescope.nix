{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim;
in
{
  config = mkIf (cfg.picker == "telescope") {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.editor.telescope" ];
      extraPlugins = with pkgs.vimPlugins; [
        telescope-nvim
        telescope-fzf-native-nvim
        dressing-nvim
      ];

      excludePlugins = with pkgs.vimPlugins; [
        fzf-lua
      ];
    };
  };
}
