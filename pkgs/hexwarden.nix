{
  lib,
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule {
  pname = "hexwarden";
  version = "dev";
  src = fetchFromGitHub {
    owner = "hambosto";
    repo = "hexwarden";
    rev = "a24b18e760479bb0945afc7571b8f618ad434237";
    hash = "sha256-74b08ujD5tkH0F9ZpqmvFhsHzdS/Be/6kASTyUq3SzU=";
  };

  vendorHash = "sha256-wPafIby3qQU2eprn8VdHH/lAQpm+Ld/f20z4hzyoRPg=";
  env.CGO_ENABLED = 0;
  flags = [ "-trimpath" ];
  ldflags = [
    "-s"
    "-w"
    "-extldflags -static"
  ];

  meta = with lib; {
    description = "Secure file encryption and decryption CLI tool built with Go";
    homepage = "https://github.com/hambosto/hexwarden";
    mainProgram = "hexwarden";
    license = licenses.gpl3;
    maintainers = with maintainers; [ hambosto ];
  };
}
