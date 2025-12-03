{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.rustlang;
  tomlFormat = pkgs.formats.toml { };
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
in
{
  options = {
    programs.rustlang = {
      enable = mkEnableOption "Rust development environment";

      packages = mkOption {
        type = types.listOf types.package;
        default = with pkgs; [
          cargo
          rustc
          rustfmt
          clippy
          stdenv.cc
        ];
        description = ''
          Rust toolchain packages to install. Defaults include the Rust compiler (rustc),
          package manager (cargo), code formatter (rustfmt), linter (clippy), and C/C++ toolchain.
        '';
      };

      cargoSettings = mkOption {
        type = tomlFormat.type;
        default = { };
        description = ''
          Configuration written to ~/.cargo/config.toml.
          See <https://doc.rust-lang.org/cargo/reference/config.html> for available options.
        '';
      };

      setRustSrcPath = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Whether to set the RUST_SRC_PATH environment variable pointing to the Rust standard library source.
          Required for tools like rust-analyzer to provide jump-to-definition for standard library code.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = cfg.packages;

      sessionVariables = mkIf cfg.setRustSrcPath {
        RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
      };

      file.".cargo/config.toml" = mkIf (cfg.cargoSettings != { }) {
        source = tomlFormat.generate "config.toml" cfg.cargoSettings;
      };
    };
  };
}
