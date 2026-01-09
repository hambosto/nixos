{
  fetchgit,
  installShellFiles,
  lib,
  libxkbcommon,
  lz4,
  pkg-config,
  rustPlatform,
  scdoc,
  wayland-protocols,
  wayland-scanner,
}:
rustPlatform.buildRustPackage {
  pname = "awww";
  version = "0.11.2";

  src = fetchgit {
    url = "https://codeberg.org/LGFae/awww.git";
    rev = "b0068dda802123dac53f5efae11f6792bf6b7cc8";
    hash = "sha256-3zIOjIidbrHXTxEzjPVrwSd19Mwdfw58VvSnTWtlunc=";
  };

  cargoHash = "sha256-rWhKKd5UmIeHLIPerskN9nYiNpidCWYFGbDKXclmWGw=";

  buildInputs = [
    libxkbcommon
    lz4
    wayland-protocols
    wayland-scanner
  ];

  nativeBuildInputs = [
    installShellFiles
    pkg-config
    scdoc
  ];

  doCheck = false;

  postInstall = ''
    for f in doc/*.scd; do
      local page="doc/$(basename "$f" .scd)"
      scdoc < "$f" > "$page"
      installManPage "$page"
    done

    installShellCompletion --cmd awww \
      --bash completions/awww.bash \
      --fish completions/awww.fish \
      --zsh completions/_awww
  '';

  meta = {
    description = "Efficient animated wallpaper daemon for wayland, controlled at runtime";
    homepage = "https://github.com/LGFae/swww";
    license = lib.licenses.gpl3;
    mainProgram = "awww";
    platforms = lib.platforms.linux;
  };
}
