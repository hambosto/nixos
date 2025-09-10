{
  programs.fastfetch = {
    enable = true;
    settings = {

      logo = {
        source = ../../img/nixos_custom_cat.png;
        type = "kitty-direct";
        height = 15;
        width = 30;
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
