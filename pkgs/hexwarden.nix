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
    rev = "91ad4025b49520455feb20f4d2d9f2fc751e7355";
    hash = "sha256-Wf4Y+fu5tgcX4o9SMDQTlVnjLZQqiSJ9Ubi7CFvQcYw=";
  };

  vendorHash = "sha256-w1rxj2G0ZaWfmtDNlGyCfYg8ZKjVmPbWfKVGALPEMyE=";
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
