{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.dap;
in
{
  options.programs.lazyvim.dap = {
    enable = mkEnableOption "Debugging support";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.editor.dap" ];
      extraPlugins = with pkgs.vimPlugins; [
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text
        nvim-nio
        mason-nvim-dap-nvim
      ];
    };
  };
}
