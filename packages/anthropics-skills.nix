{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "anthropics-skills";
  version = "unstable-2026-03-25";

  src = fetchFromGitHub {
    owner = "anthropics";
    repo = "skills";
    rev = "98669c11ca63e9c81c11501e1437e5c47b556621";
    hash = "sha256-w//9LB1OVG9jlllY+VDse7Js0dn5x6Ys2vPuQACKsTM=";
  };

  buildPhase = ''
    mkdir $out
    cp -r $src/* $out
  '';

  meta = with lib; {
    description = "Public repository for Agent Skills";
    homepage = "https://github.com/anthropics/skills";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
