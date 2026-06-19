{
  programs.fastfetch = {
    enable = false;
    settings = {
      display = {
        separator = " ─➤ ";
      };

      logo = {
        padding = {
          left = 3;
          top = 1;
        };
        source = ../../assets/fastfetch-logo.txt;
        type = "file";
      };

      modules = [
        {
          type = "custom";
          format = "─────────────────────────────────────────";
        }
        {
          type = "os";
          key = " ";
          keyColor = "red";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = " ";
          "keyColor" = "yellow";
        }
        {
          type = "memory";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "disk";
          key = " ";
          keyColor = "magenta";
          format = "{1} / {2} ({9})";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "cyan";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "red";
        }
        {
          type = "custom";
          format = "─────────────────────────────────────────";
        }
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
