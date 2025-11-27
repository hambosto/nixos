{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.programs.rust-lang = {
    enable = lib.mkEnableOption "Enable Rust developer packages and environment variables for Home Manager.";

    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [
        pkgs.cargo
        pkgs.rustc
        pkgs.rustfmt
        pkgs.clippy
        pkgs.stdenv.cc
      ];
      description = "List of pkgs package expressions to add to home.packages when programs.rust-lang.enable = true.";
    };

    setRustSrcPath = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to export RUST_SRC_PATH from pkgs.rustPlatform.rustLibSrc into home.sessionVariables.";
    };
  };

  config = lib.mkIf config.programs.rust-lang.enable {
    home.packages = lib.concatLists [
      (if config.programs.rust-lang.enable then config.programs.rust-lang.packages else [ ])
    ];

    home.sessionVariables = lib.mkIf config.programs.rust-lang.setRustSrcPath {
      RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
    };
  };
}
