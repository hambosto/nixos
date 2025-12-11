{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.dial;
in
{
  options.programs.lazyvim.dial = {
    enable = mkEnableOption "Increment and decrement numbers, dates, and more";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.coding.dial" ];
      extraPlugins = with pkgs.vimPlugins; [
        dial-nvim
      ];
    };
  };
}
