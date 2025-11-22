{ config, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {

      logo = {
        source = ../../assets/nixos_ascii.txt;
        type = "file";
        padding = {
          left = 3;
        };
        color = {
          "1" = "#${config.lib.stylix.colors.base08}";
          "2" = "#${config.lib.stylix.colors.base09}";
          "3" = "#${config.lib.stylix.colors.base0A}";
          "4" = "#${config.lib.stylix.colors.base0B}";
          "5" = "#${config.lib.stylix.colors.base0D}";
          "6" = "#${config.lib.stylix.colors.base0E}";
        };

      };

      display = {
        separator = "  ";
      };

      modules = [
        {
          type = "custom";
          format = "────────────────────────────────────────────────";
        }
        {
          type = "os";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "red";
        }

        {
          type = "terminal";
          key = " ";
          keyColor = "yellow";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "────────────────────────────────────────────────";
        }
        {
          type = "title";
          key = " ";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "────────────────────────────────────────────────";
        }
        {
          type = "host";
          key = " 󰌢";
          keyColor = "green";
        }
        {
          type = "display";
          key = " 󰍹";
          keyColor = "red";
        }
        {
          type = "cpu";
          key = " ";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = " ";
          keyColor = "green";
        }
        {
          type = "disk";
          key = " ";
          keyColor = "cyan";
        }
        {
          type = "uptime";
          key = " ";
          keyColor = "cyan";
        }
        {
          type = "custom";
          format = "────────────────────────────────────────────────";
        }
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
