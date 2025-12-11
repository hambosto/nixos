{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.sidekick;
in
{
  options.programs.lazyvim.sidekick = {
    enable = mkEnableOption "AI plugin - sidekick";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.ai.sidekick" ];
      extraPlugins = with pkgs.vimPlugins; [
        sidekick-nvim
      ];
    };
  };
}
