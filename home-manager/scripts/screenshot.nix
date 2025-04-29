{
  pkgs,
  ...
}:
let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    # Default screenshot save directory
    SAVE_DIR="''${HOME}/Pictures/Screenshots"
    mkdir -p "$SAVE_DIR"

    TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')

    function capture_selection {
      ${pkgs.grimblast}/bin/grimblast --notify save area "$SAVE_DIR/selection_''${TIMESTAMP}.png"
    }

    function capture_active {
      ${pkgs.grimblast}/bin/grimblast --notify save active "$SAVE_DIR/active_''${TIMESTAMP}.png"
    }

    function capture_all {
      ${pkgs.grimblast}/bin/grimblast --notify save screen "$SAVE_DIR/full_''${TIMESTAMP}.png"
    }

    case "$1" in
      selection) capture_selection ;;
      active) capture_active ;;
      everything) capture_all ;;
      *)
        echo "Usage: screenshot [selection|active|everything]"
        exit 1
        ;;
    esac
  '';

in
{
  home.packages = [ screenshot ];
}
