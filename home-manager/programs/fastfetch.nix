{
  programs.fastfetch = {
    enable = true;
    settings = {

      logo = {
        source = ../../assets/nixos_custom_cat.png;
        type = "kitty-direct";
        height = 15;
        width = 30;
      };

      display = {
        separator = " ";
      };

      modules = [
        {
          type = "title";
          key = "user";
          format = "// {1}";
        }
        {
          type = "title";
          key = "host";
          format = "// {2}";
        }
        {
          type = "os";
          key = "os";
          format = "// {3}";
        }
        {
          type = "kernel";
          key = "kernel";
          format = "// {1} {2}";
        }
        {
          type = "packages";
          key = "packages";
          format = "// {9} (nix-system) - {10} (nix-user)";
        }
        {
          type = "display";
          key = "display";
          format = "// {1}x{2} @{3}Hz [{7}]";
        }
        {
          type = "terminal";
          key = "terminal";
          format = "// {5} {6}";
        }
        {
          type = "wm";
          key = "wm";
          format = "// {2} {5} ({3})";
        }
        {
          type = "cpu";
          key = "cpu";
          format = "// {1} ({4}) {7}";
        }
        {
          type = "gpu";
          key = "gpu";
          format = "// {1} {2} ({3})";
        }
        {
          type = "memory";
          key = "memory";
          format = "// {1} / {2} ({3})";
        }
        {
          type = "disk";
          key = "disk";
          format = "// {1} / {2} ({3})";
        }
        {
          type = "localip";
          key = "network";
          format = "// {1} ({4})";
        }
        {
          type = "uptime";
          key = "uptime";
          format = "// {1} days, {2} hours, {3} minutes";
        }
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
