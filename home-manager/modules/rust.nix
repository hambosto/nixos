{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.rust;
  tomlFormat = pkgs.formats.toml { };
in
{
  options.programs.rust = {
    enable = lib.mkEnableOption "Rust development environment";

    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        cargo
        rustc
        rustfmt
        clippy
      ];
      description = "Rust toolchain packages.";
    };

    settings = lib.mkOption {
      type = tomlFormat.type;
      default = { };
      description = "Cargo config, written to $CARGO_HOME/config.toml.";
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = cfg.packages;
      sessionPath = [ "${config.home.homeDirectory}/.cargo/bin" ];
      file.".cargo/config.toml" = lib.mkIf (cfg.settings != { }) {
        source = tomlFormat.generate "config.toml" cfg.settings;
      };
    };
  };
}
