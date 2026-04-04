{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "rust-skills";
  version = "unstable-2026-01-19";

  src = fetchFromGitHub {
    owner = "leonardomso";
    repo = "rust-skills";
    rev = "0373001db0b774a84a691847bc2d248186063f39";
    hash = "sha256-y5XW62XXArJ60z3/fJE/KED+oILn9qpiUkcGI27dAxc=";
  };

  buildPhase = ''
    mkdir $out
    cp -r $src/* $out
  '';

  meta = with lib; {
    description = "A collection of 179 rules that AI coding agents can use when writing Rust.";
    homepage = "https://github.com/leonardomso/rust-skills";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
