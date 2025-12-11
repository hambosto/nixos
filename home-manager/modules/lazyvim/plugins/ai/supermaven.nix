{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.supermaven;
in
{
  options.programs.lazyvim.supermaven = {
    enable = mkEnableOption "AI plugin - Supermaven";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      extraPlugins = with pkgs.vimPlugins; [
        supermaven-nvim
      ];

      imports = [ "lazyvim.plugins.extras.ai.supermaven" ];
    };
  };
}
