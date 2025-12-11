{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
  cfg = config.programs.lazyvim.clangd;
in
{
  options.programs.lazyvim.clangd = {
    enable = mkEnableOption "language clangd";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      imports = [ "lazyvim.plugins.extras.lang.clangd" ];
      extraPlugins = with pkgs.vimPlugins; [
        clangd_extensions-nvim
      ];

      extraPackages = with pkgs; [
        vscode-extensions.vadimcn.vscode-lldb
        clang-tools
      ];
    };
  };
}
