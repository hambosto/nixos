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
    rev = "f31ef55f6debc9e27fc3039acb1fc1f3c4ca346f";
    hash = "sha256-+kHk73iujN9FudnvLZdx5bbydOsyQbtXkkBpvrli3oY=";
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
  };
}
