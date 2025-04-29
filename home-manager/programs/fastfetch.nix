{
  programs.fastfetch = {
    enable = true;
    settings = {

      logo = {
        source = "NixOS";
      };

      display = {
        separator = "  ";
      };

      modules = [
        {
          type = "command";
          key = "  󰊠";
          keyColor = "blue";
          text = "hyprctl splash";
        }
        {
          type = "custom";
          format = "┌──────────────────────────────────────────────────┐";
        }
        {
          type = "chassis";
          key = "  󰇺";
          format = "{1} {2} {3}";
        }
        {
          type = "os";
          key = "  ";
          format = "{3}";
          keyColor = "red";
        }
        {
          type = "kernel";
          key = "  ";
          format = "{1} {2}";
          keyColor = "red";
        }
        {
          type = "packages";
          key = "  󰏗";
          keyColor = "green";
        }
        {
          type = "display";
          key = "  󰍹";
          format = "{1}x{2} @ {3}Hz [{7}]";
          keyColor = "green";
        }
        {
          type = "terminal";
          key = "  ";
          keyColor = "yellow";
        }
        {
          type = "wm";
          key = "  ";
          keyColor = "yellow";
        }
        {
          type = "custom";
          format = "└──────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "title";
          key = "  ";
          format = "{6}{7}{8}";
        }
        {
          type = "custom";
          format = "┌──────────────────────────────────────────────────┐";
        }
        {
          type = "cpu";
          format = "{1} @ {7}";
          key = "  ";
          keyColor = "blue";
        }
        {
          type = "gpu";
          format = "{1} {2}";
          key = "  󰊴";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = "  ";
          keyColor = "magenta";
        }
        {
          type = "disk";
          key = "  ";
          keyColor = "red";
        }
        {
          type = "uptime";
          key = "  󱫐";
          keyColor = "red";
        }
        {
          type = "custom";
          format = "└──────────────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
        "break"
      ];
    };
  };
}
