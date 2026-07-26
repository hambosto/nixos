{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "tui-design";
  version = "unstable-2026-05-18";

  src = fetchFromGitHub {
    owner = "hyperb1iss";
    repo = "hyperskills";
    rev = "4b4c65ddddfef808c61387ba7aa56810ee05e79e";
    hash = "sha256-DPQ66y09ZzthugMRa7cEwk4DuZX78FTNBie02p6kR8k=";
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
