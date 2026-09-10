{
  lib,
  fetchFromGitHub,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "harmonyos-sans";
  version = "1.0"; # from font metadata

  src = fetchFromGitHub {
    owner = "openharmony";
    repo = "resources";
    rev = "9c3252997df79002beb67c13903755651215f9cd";
    hash = "sha256-GUkpEZWFAMnTWHwfcHBXSpTMgxWBluTwIKJAtr3s9yA=";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 -t $out/share/fonts/truetype fonts/*.ttf

    runHook postInstall
  '';

  meta = {
    homepage = "https://github.com/openharmony/resources";
    description = "HarmonyOS Sans font (from the OpenHarmony resources repo)";
    platforms = lib.platforms.all;
    license = lib.licenses.unfree;
  };
}
