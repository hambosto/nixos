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
    rev = "0647fafcec1628665098451ff4a15517508baa6f";
    sha256 = "sha256-MY00/mV6SNG7O1Q7Dpl9T0mQpzqumzZvbyF+HbI2P1M=";
  };

  cargoHash = "sha256-+KzZgHfyEU7JsZXg0ibG/6w+o5yI53FnJka42zfF2Gg=";

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
