{ lib, pkgs, ... }:
let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    SCREENSHOT_DIR="''${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    mkdir -p "$SCREENSHOT_DIR"

    take_screenshot() {
        local mode="$1"
        local filename="screenshot_''${mode}_''${TIMESTAMP}.png"
        local filepath="$SCREENSHOT_DIR/$filename"
        
        case "$mode" in
            "screen")
                if ${lib.getExe pkgs.grimblast} --notify save screen "$filepath"; then
                    echo "Screenshot saved: $filepath"
                else
                    echo "Error: Failed to take screenshot"
                    exit 1
                fi
                ;;
            "area")
                if ${lib.getExe pkgs.grimblast} --notify save area "$filepath"; then
                    echo "Screenshot saved: $filepath"
                else
                    echo "Error: Failed to take screenshot"
                    exit 1
                fi
                ;;
            *)
                echo "Usage: $0 [screen|area]"
                echo "  screen - Capture entire screen"
                echo "  area   - Capture selected area"
                exit 1
                ;;
        esac
    }

    if [ $# -eq 0 ]; then
        echo "Grimblast Screenshot Tool"
        echo "Screenshots will be saved to: $SCREENSHOT_DIR"
        echo ""
        echo "Select screenshot type:"
        echo "1) Full screen"
        echo "2) Select area"
        echo "3) Exit"
        echo ""
        read -r -p "Enter your choice (1-3): " choice
        
        case "$choice" in
            1) take_screenshot "screen" ;;
            2) take_screenshot "area" ;;
            3) echo "Goodbye!"; exit 0 ;;
            *) echo "Invalid choice"; exit 1 ;;
        esac
    else
        take_screenshot "$1"
    fi
  '';
in
{
  home.packages = [ screenshot ];
}
