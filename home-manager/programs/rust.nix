{
  config,
  lib,
  pkgs,
  ...
}:
let
  rust-package =
    with lib;
    let
      cfg = config.programs.rust;
      rust-profile = pkgs.rust-bin.selectLatestNightlyWith (
        toolchain:
        toolchain.default.override {
          extensions = [
            "cargo"
            "clippy"
            "rust-docs"
            "rust-src"
            "rust-std"
            "rustc"
            "rustfmt"
            "rust-analyzer"
          ];
          targets = [ "x86_64-unknown-linux-gnu" ];
        }
      );
    in
    {
      options.programs.rust = {
        enable = mkEnableOption "Enable the Rust programming language";

        package = mkOption {
          type = types.package;
          default = rust-profile;
          description = "The Rust package to use.";
        };
      };

      config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
      };
    };
in
{
  imports = [ rust-package ];

  programs.rust = {
    enable = false;
  };
}
