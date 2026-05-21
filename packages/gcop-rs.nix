{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "gcop-rs";
  version = "0.13.9";

  src = fetchFromGitHub {
    owner = "AptS-1547";
    repo = "gcop-rs";
    rev = "3f99eb2636c602ceff028a87060f1e0234b9c528";
    sha256 = "sha256-d5q7oEL78EJ/uA/Lva13wnuCVtBofiOIm5AxVP3mYdQ=";
  };

  cargoHash = "sha256-LjXr+shJBQ0eveTDH1wlyzcW8hYMnG9z+3zRv0WNEWI=";

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  doCheck = false;

  meta = {
    description = "AI-powered Git commit message generator and code reviewer";
    homepage = "https://github.com/AptS-1547/gcop-rs";
    license = lib.licenses.asl20;
    mainProgram = "gcop-rs";
    platforms = lib.platforms.all;
  };
})
