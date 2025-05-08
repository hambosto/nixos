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

    take_screenshot() {
      local mode=$1
      local filename="$SAVE_DIR/screenshot_$TIMESTAMP.png"
      
      case "$mode" in
        selection) target_mode="area" ;;
        everything) target_mode="screen" ;;
        *) echo "Invalid mode: $mode" && exit 1 ;;
      esac
      
      ${lib.getExe pkgs.grimblast} --notify save "$target_mode" "$filename"
    }

    if [ $# -eq 0 ]; then
      echo "Usage: screenshot [selection|everything]"
      exit 1
    fi

    take_screenshot "$1"
  '';
in
{
  home.packages = [ screenshot ];
}
