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
    longDescription = ''
      Use `iwmenu --launcher <launcher command>`
      Supported launchers are: `dmenu`, `fuzzel`, `rofi`, `walker` and `custom` with `stdin`
      for details refer to https://github.com/e-tho/iwmenu/blob/main/README.md#usage
    '';
    mainProgram = "iwmenu";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ vuimuich ];
  };
}
