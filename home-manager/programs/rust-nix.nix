{
  inputs,
  ...
}:
{
  imports = [ inputs.rust-nix.homeManagerModules.default ];

  programs.rust-nix = {
    enable = false;
    channel = "nightly";
    toolchain = [
      "cargo"
      "clippy"
      "rust-docs"
      "rust-src"
      "rust-std"
      "rustc"
      "rustfmt"
      "rust-analyzer"
    ];
    targets = [
      "x86_64-unknown-linux-gnu"
    ];
  };
}
