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
  config = mkIf (cfg.cmp == "nvim-cmp") {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.coding.cmp" ];
      extraPlugins = with pkgs.vimPlugins; [
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        nvim-snippets
        friendly-snippets
      ];

      excludePlugins = with pkgs.vimPlugins; [
        blink-cmp
        blink-compat
      ];
    };
  };
}
