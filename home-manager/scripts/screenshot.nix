{ lib, pkgs, ... }:
let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    # Grimblast Screenshot Script
    # Usage: grimblast-screenshot [screen|area]

    # Configuration
    SCREENSHOT_DIR="''${XDG_PICTURES_DIR:-$HOME/Pictures}/grimblast"
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

    # Create screenshot directory if it doesn't exist
    mkdir -p "$SCREENSHOT_DIR"

    # Function to take screenshot
    take_screenshot() {
        local mode="$1"
        local filename="screenshot_''${mode}_''${TIMESTAMP}.png"
        local filepath="$SCREENSHOT_DIR/$filename"
        
        case "$mode" in
            "screen")
                ${lib.getExe pkgs.grimblast} --notify save screen "$filepath"
                ;;
            "area")
                ${lib.getExe pkgs.grimblast} --notify save area "$filepath"
                ;;
            *)
                echo "Usage: $0 [screen|area]"
                echo "  screen - Capture entire screen"
                echo "  area   - Capture selected area"
                exit 1
                ;;
        esac
        
        if [ $? -eq 0 ]; then
            echo "Screenshot saved: $filepath"
        else
            echo "Error: Failed to take screenshot"
            exit 1
        fi
    }

    # Main script logic
    if [ $# -eq 0 ]; then
        # No arguments provided, show menu
        echo "Grimblast Screenshot Tool"
        echo "Screenshots will be saved to: $SCREENSHOT_DIR"
        echo ""
        echo "Select screenshot type:"
        echo "1) Full screen"
        echo "2) Select area"
        echo "3) Exit"
        echo ""
        read -p "Enter your choice (1-3): " choice
        
        case "$choice" in
            1) take_screenshot "screen" ;;
            2) take_screenshot "area" ;;
            3) echo "Goodbye!"; exit 0 ;;
            *) echo "Invalid choice"; exit 1 ;;
        esac
    else
        # Argument provided
        take_screenshot "$1"
    fi
  '';
in
{
  home.packages = [ screenshot ];
}
