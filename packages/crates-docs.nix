{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "crates-docs";
  version = "unstable-2026-08-4";

  src = fetchFromGitHub {
    owner = "KingingWang";
    repo = "crates-docs";
    rev = "b494d08b701f8c1b4b2a8ef420b8ed266f94d53c";
    sha256 = "sha256-SXoFOwUcW+Z3SV6SEyJxAp8d1nX19viMwQh5kvUXAc4=";
  };

  cargoHash = "sha256-LoYwBKKIACidcliuYcTpSc3PlUZytiHu+6ixnZqA49o=";

  doCheck = false;

  meta = {
    description = "A high-performance Rust crate documentation query MCP server supporting multiple transport protocols.";
    homepage = "https://github.com/KingingWang/crates-docs";
    license = lib.licenses.asl20;
    mainProgram = "crates-docs";
    platforms = lib.platforms.all;
  };
})
