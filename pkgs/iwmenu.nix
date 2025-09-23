{
  fetchFromGitHub,
  lib,
  rustPlatform,
}:

rustPlatform.buildRustPackage {
  pname = "iwmenu";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "e-tho";
    repo = "iwmenu";
    rev = "91c8637db76d9e3a303e57c01de67d0cf12631b2";
    hash = "sha256-1fnf5RlXTUA86UyAoCwjJ/XlP+m3rql0IKNT4W3ui/w=";
  };

  cargoHash = "sha256-yi42BrdcAVEbkvPOyi4VxWO6F0x7vbjLZ/hLqWdeIn0=";

  doCheck = true;
  CARGO_BUILD_INCREMENTAL = "false";
  RUST_BACKTRACE = "full";

  meta = {
    homepage = "https://github.com/e-tho/iwmenu";
    description = "Launcher-driven Wi-Fi manager for Linux";
    mainProgram = "iwmenu";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3Plus;
  };
}
