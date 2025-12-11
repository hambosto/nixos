{ lib }:
let
  arg = { inherit lib; };

  # Import the paths functions that include sourceLua
  paths = import ./paths.nix arg;
  coreImported = import ./core.nix arg;
in
coreImported.deepMerge [
  paths
  coreImported
]
