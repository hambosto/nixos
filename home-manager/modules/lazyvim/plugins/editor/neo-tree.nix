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
  config = mkIf (cfg.explorer == "neo-tree") {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.editor.neo-tree" ];
      extraPlugins = with pkgs.vimPlugins; [
        neo-tree
      ];
    };
  };
}
