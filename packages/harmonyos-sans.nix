{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "harmonyos-sans";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "openharmony";
    repo = "resources";
    rev = "0d79cad76b37ba0f3ccb1323c83833c78e0860de";
    hash = "sha256-0jIaSp3WJ9jiTFS9nhwUo27N8WWne/yW9Y8vQ+sgHoI=";
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
    description = "HarmonyOS Sans font";
    platforms = lib.platforms.all;
    license = lib.licenses.unfree;
  };
}
