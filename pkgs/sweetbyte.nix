{
  lib,
  fetchFromGitHub,
  buildGoModule,
  installShellFiles,
}:
buildGoModule {
  pname = "sweetbyte";
  version = "git";

  src = fetchFromGitHub {
    owner = "hambosto";
    repo = "sweetbyte";
    rev = "a2e2761f7aece94da832a66c15f15ad1dc8a6f02";
    hash = "sha256-y+rwVpLrcMmfpIaM1lzdUKyNxTZYpyIV6c0NqGn0lnc=";
  };

  vendorHash = "sha256-mVtkLu0ZfQCJ5JGswx1R7gu2WxgwTqB6igOg+BrUBM4=";

  env.CGO_ENABLED = 0;
  flags = [ "-trimpath" ];
  ldflags = [
    "-s"
    "-w"
    "-extldflags -static"
  ];

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = ''
    installShellCompletion --cmd sweetbyte \
      --bash <($out/bin/sweetbyte completion bash) \
      --fish <($out/bin/sweetbyte completion fish) \
      --zsh <($out/bin/sweetbyte completion zsh)
  '';

  meta = with lib; {
    description = "A very small, very simple, yet very secure encryption tool.";
    homepage = "https://github.com/hambosto/sweetbyte";
    mainProgram = "sweetbyte";
    license = licenses.gpl3;
    maintainers = with maintainers; [ hambosto ];
  };
}
