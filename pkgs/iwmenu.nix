{
  fetchFromGitHub,
  lib,
  rustPlatform,
}:

rustPlatform.buildRustPackage {
  pname = "iwmenu";
  version = "git";

  src = fetchFromGitHub {
    owner = "e-tho";
    repo = "iwmenu";
    rev = "8333f07050d0bb69c9305ab0a5ec8229db72ed2e";
    hash = "sha256-+zvGPq1s92CBKiaHMGMsfIKYK5OxoDD5I7j3wjLqzf8=";
  };

  cargoHash = "sha256-Bwv4yrOARbNMSLyaYWajvR94WmuCicFQFr6GGKD938g=";

  meta = {
    homepage = "https://github.com/e-tho/iwmenu";
    description = "Launcher-driven Wi-Fi manager for Linux";
    mainProgram = "iwmenu";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3Plus;
  };
}
