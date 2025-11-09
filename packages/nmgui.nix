{
  lib,
  python3Packages,
  fetchFromGitHub,
  wrapGAppsHook4,
  gobject-introspection,
  gtk4,
  glib,
}:

python3Packages.buildPythonApplication {
  pname = "nmgui";
  version = "1.0";
  format = "other";

  src = fetchFromGitHub {
    owner = "s-adi-dev";
    repo = "nmgui";
    rev = "8bf7a76629317151b8027eaec82de66dd5cf700a";
    hash = "sha256-18KIIwjqZ2tEcSbOnSAX30g6NL7MOHS00opfQfoZozE=";
  };

  nativeBuildInputs = [
    wrapGAppsHook4
    gobject-introspection
  ];

  buildInputs = [
    gtk4
    glib
  ];

  dependencies = with python3Packages; [
    pygobject3
    nmcli
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{bin,share/applications,opt/nmgui}
    # Copy the app files
    cp -r app $out/opt/nmgui/

    runHook postInstall
  '';

  postFixup = ''
    makeWrapper ${python3Packages.python.interpreter} $out/bin/nmgui \
      --add-flags "$out/opt/nmgui/app/main.py" \
      --prefix PYTHONPATH : "$PYTHONPATH" \
      "''${gappsWrapperArgs[@]}"
  '';

  meta = {
    description = "Python library for interacting with NetworkManager CLI";
    homepage = "https://github.com/s-adi-dev/nmgui";
    license = lib.licenses.gpl3Plus;
    mainProgram = "nmgui";
  };
}
