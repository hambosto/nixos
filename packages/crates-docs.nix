{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "crates-docs";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "KingingWang";
    repo = "crates-docs";
    rev = "8d8c2956085c0b39b58219351a5f753eda940598";
    sha256 = "sha256-t6rslyDyEjIfJgBpeNDR+HOyh7MZf10ZPmj1aim8iUU=";
  };

  cargoHash = "sha256-uvZTydXMmSdTNz3n0QS1zGHt4yb1RQHOeWsY4YoMmzg=";

  doCheck = false;

  meta = {
    description = "A high-performance Rust crate documentation query MCP server supporting multiple transport protocols.";
    homepage = "https://github.com/KingingWang/crates-docs";
    license = lib.licenses.asl20;
    mainProgram = "crates-docs";
    platforms = lib.platforms.all;
  };
})
