{ config, ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      display.separator = "  ";

      logo = {
        color = with config.lib.stylix.colors.withHashtag; {
          "1" = base08;
          "2" = base09;
          "3" = base0A;
          "4" = base0B;
          "5" = base0C;
          "6" = base0D;
        };
        padding.left = 3;
        source = ../../assets/fastfetch-logo.txt;
        type = "file";
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
          format = "{1} {2}";
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
