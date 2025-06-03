{
  config,
  lib,
  pkgs,
  ...
}:

let
  rustToolchain = pkgs.rust-bin.selectLatestNightlyWith (
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

  rustModule = {
    options.programs.rust-lang = with lib; {
      enable = mkEnableOption "Enable the Rust programming language";

      package = mkOption {
        type = types.package;
        default = rustToolchain;
        description = "The Rust package to use.";
      };
    };

    config = lib.mkIf config.programs.rust-lang.enable {
      home.packages = [ config.programs.rust-lang.package ];
    };
  };
in
{
  imports = [ rustModule ];

  programs.rust-lang.enable = false;
}
