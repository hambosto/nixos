{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.windsurf;
in
{
  options.programs.lazyvim.windsurf = {
    enable = mkEnableOption "AI plugin - windsurf";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      extraPlugins = with pkgs.vimPlugins; [
        windsurf-nvim
      ];

      # extraSpec = ''
      #   { import = "lazyvim.plugins.extras.ai.codeium" },
      # '';

      config = [ "ai/windsurf.lua" ];
    };
  };
}
