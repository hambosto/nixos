{
  lib,
  stdenv,
  fetchzip,
}:

stdenv.mkDerivation rec {
  pname = "nextia-mono";
  version = "0.2-alpha";

  src = fetchzip {
    url = "https://github.com/nextiaindex/nextia-mono/releases/download/v${version}/NextiaMono-v${version}.zip";
    sha256 = "sha256-IR3fNUON/pNqwiBy2QNd+DfUUzN926g0lrZ1Sv0c1DY";
    stripRoot = false;
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall

    install -m444 -Dt $out/share/fonts/truetype/nextia-mono *.ttf

    runHook postInstall
  '';

  meta = with lib; {
    description = "NextiaMono - Custom Iosevka-like monospaced font";
    homepage = "https://github.com/nextiaindex/nextia-mono";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = [ nextia-index ];
  };
}
