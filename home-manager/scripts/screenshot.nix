{
  config,
  lib,
  pkgs,
  ...
}:
let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    SAVE_DIR="${config.home.homeDirectory}/Pictures/Screenshots"
    TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
    mkdir -p "$SAVE_DIR"

    if [ $# -eq 0 ]; then
      echo "Usage: screenshot [selection|everything]"
      exit 1
    fi

    mode=$1
    filename="$SAVE_DIR/screenshot_$TIMESTAMP.png"

    case "$mode" in
      selection) target_mode="area" ;;
      everything) target_mode="screen" ;;
      *) echo "Invalid mode: $mode" && exit 1 ;;
    esac

    ${lib.getExe pkgs.grimblast} --notify save "$target_mode" "$filename"
  '';
in
{
  home.packages = [ screenshot ];
}
