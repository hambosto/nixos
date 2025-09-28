{
  clang,
  fetchFromGitHub,
  lib,
  llvmPackages,
  pipewire,
  pkg-config,
  rustPlatform,
}:

rustPlatform.buildRustPackage {
  pname = "pwmenu";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "e-tho";
    repo = "pwmenu";
    rev = "b00c1f759943c4e96044706ae3808cc5ab421ff3";
    hash = "sha256-OzmGYQ9LjGOzka9UiLrvzudUdH8zrkQgzmGiRmxMViE=";
  };

  cargoHash = "sha256-jX4D4Xv2WYTcWnYO2cNsu7L9ppIw//Tkxl+Y7tflk+A=";

  nativeBuildInputs = [
    pkg-config
    clang
    llvmPackages.libclang
  ];

  buildInputs = [
    pipewire.dev
  ];

  LIBCLANG_PATH = "${llvmPackages.libclang.lib}/lib";

  doCheck = true;
  CARGO_BUILD_INCREMENTAL = "false";
  RUST_BACKTRACE = "full";

  meta = {
    homepage = "https://github.com/e-tho/pwmenu";
    description = "Launcher-driven audio manager for Linux";
    mainProgram = "pwmenu";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3Plus;
  };
}
