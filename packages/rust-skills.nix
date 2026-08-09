{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "rust-skills";
  version = "unstable-2026-06-15";

  src = fetchFromGitHub {
    owner = "leonardomso";
    repo = "rust-skills";
    rev = "fd2a861ab0406a4ac536a55274d14ea6fd1ca9c9";
    hash = "sha256-B6E8JP78/wDdJYHp1l5cpEgxRuCzAhOhUtst4pueMw0=";
  };

  buildPhase = ''
    mkdir $out
    cp -r $src/* $out
  '';

  dontInstall = true;
  dontConfigure = true;

  meta = with lib; {
    description = "A collection of 265 rules across 26 categories that AI coding agents can use to write idiomatic, fast, and safe Rust.";
    homepage = "https://github.com/leonardomso/rust-skills";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
