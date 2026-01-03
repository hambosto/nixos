{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        key.width = 8;
        separator = " ";
      };

      logo = {
        padding = {
          left = 3;
          top = 2;
        };
        source = ../../assets/fastfetch-logo.txt;
        type = "file";
      };

      modules = [
        {
          type = "custom";
          format = "";
        }
        {
          type = "os";
          key = "os";
          keyColor = "magenta";
        }
        {
          type = "kernel";
          key = "ker";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "pkgs";
          keyColor = "cyan";
        }
        {
          type = "shell";
          key = "sh";
          keyColor = "blue";
          format = "{6}";
        }
        {
          type = "memory";
          key = "ram";
          keyColor = "yellow";
        }
        {
          type = "custom";
          key = "init";
          format = "systemd";
          keyColor = "magenta";
        }
        {
          type = "wm";
          key = "de/wm";
          keyColor = "green";
        }
        {
          type = "uptime";
          key = "up";
          keyColor = "cyan";
        }
        {
          type = "disk";
          key = "disk";
          keyColor = "yellow";
          format = "{1} / {2} ({9})";
        }
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
