{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.zig;
  jsonFormat = pkgs.formats.json { };
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
in
{
  options = {
    programs.zig = {
      enable = mkEnableOption "Zig development environment";

      packages = mkOption {
        type = types.listOf types.package;
        default = with pkgs; [
          zig
          zls
        ];
        description = ''
          Zig toolchain packages to install. Defaults include the Zig compiler (zig)
          and Zig Language Server (zls).
        '';
      };

      zlsSettings = mkOption {
        type = jsonFormat.type;
        default = { };
        description = ''
          Configuration written to ~/.config/zls.json.
          See <https://github.com/zigtools/zls#configuration-options> for available options.
        '';
      };

      setZigLibPath = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Whether to set the ZIG_LIB_DIR environment variable pointing to the Zig standard library.
          Required for some tools to locate Zig's standard library.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = cfg.packages;

      sessionVariables = mkIf cfg.setZigLibPath {
        ZIG_LIB_DIR = "${pkgs.zig}/lib/zig";
      };

      file.".config/zls.json" = mkIf (cfg.zlsSettings != { }) {
        source = jsonFormat.generate "zls.json" cfg.zlsSettings;
      };
    };
  };
}
