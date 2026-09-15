{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "tui-design";
  version = "unstable-2026-09-05-5c2f961";

  src = fetchFromGitHub {
    owner = "hyperb1iss";
    repo = "hyperskills";
    rev = "5c2f96185a7ea1f9a3e9e397b1687f674c4c8c36";
    hash = "sha256-ofTSnaiWoK21EjZUvbc7n4XeFZZYvfmNIw6CJ/Mna1Q=";
  };

  buildPhase = ''
    mkdir $out
    cp -r $src/skills/tui-design/* $out
  '';

  dontInstall = true;
  dontConfigure = true;

  meta = with lib; {
    description = "My collection of agent skills for a variety of tasks";
    homepage = "https://github.com/hyperb1iss/hyperskills";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
