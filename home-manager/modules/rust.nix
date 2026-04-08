{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.rust;
  tomlFormat = pkgs.formats.toml { };
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    mkMerge
    types
    ;
in
{
  options.programs.rust = {
    enable = mkEnableOption "Rust development environment";

    packages = mkOption {
      type = types.listOf types.package;
      default = with pkgs; [
        cargo
        rustc
        rustfmt
        clippy
      ];
      description = ''
        Packages that make up the Rust toolchain. The default set includes
        rustc, cargo, rustfmt, and clippy. Override this list to pin a specific
        toolchain version or swap in a rust-bin derivation from the
        oxalica/rust-overlay flake.
      '';
    };

    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [ ];
      description = ''
        Extra packages to install alongside the core Rust toolchain. Useful for
        ecosystem tooling such as cargo-watch, cargo-expand, cargo-nextest, or
        bacon without replacing the default packages set.
      '';
    };

    settings = mkOption {
      type = tomlFormat.type;
      default = { };
      description = ''
        Structured configuration serialised to $CARGO_HOME/config.toml. Accepts
        any key supported by Cargo's configuration format. See
        https://doc.rust-lang.org/cargo/reference/config.html for all available
        options.
      '';
    };

    setRustSrcPath = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Whether to export RUST_SRC_PATH pointing at the Rust standard library
        sources shipped with the toolchain. Required by rust-analyzer and racer
        to resolve and jump to definitions inside std, core, and alloc. Disable
        if you manage RUST_SRC_PATH yourself.
      '';
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      home.packages = cfg.packages ++ cfg.extraPackages;
      home.sessionPath = [ "$HOME/.cargo/bin" ];
    }

    (mkIf cfg.setRustSrcPath {
      home.sessionVariables.RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
    })

    (mkIf (cfg.settings != { }) {
      home.file.".cargo/config.toml".source = tomlFormat.generate "cargo-config.toml" cfg.settings;
    })
  ]);
}
