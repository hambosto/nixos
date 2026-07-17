{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.zig;
  jsonFormat = pkgs.formats.json { };
in
{
  options.programs.zig = {
    enable = lib.mkEnableOption "Zig development environment";

    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        zig
        zls
      ];
      description = "Zig toolchain packages.";
    };

    settings = lib.mkOption {
      type = jsonFormat.type;
      default = { };
      description = "ZLS config, written to ~/.config/zls.json.";
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = cfg.packages;
      file.".config/zls.json" = lib.mkIf (cfg.settings != { }) {
        source = jsonFormat.generate "zls.json" cfg.settings;
      };
    };
  };
}
