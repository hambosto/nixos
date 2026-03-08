{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "docs-mcp";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "mmgeorge";
    repo = "docs-mcp";
    rev = "04cfd27cba0faff6d26ea706cd798048e0e80bf4";
    sha256 = "sha256-VrkRObKQhqAm5PH4YN8ndqryL6EJkdKm71FR2H0BrF4=";
  };

  cargoHash = "sha256-YdxVIUGwijWbMi9iGX7XuUFUKmQqafSJDEWxJoqRI6I=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];

  doCheck = false;

  meta = {
    description = "MCP server using the crates.io API and docs.rs published rustdoc JSON";
    homepage = "https://github.com/mmgeorge/docs-mcp";
    license = lib.licenses.asl20;
    mainProgram = "docs-mcp";
    platforms = lib.platforms.all;
  };
})
