{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun";
      font = "Ubuntu Nerd Font 12";
      show-icons = true;
      terminal = "${lib.getExe pkgs.kitty}";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = true;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      border-radius = 10;
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      lib.mkForce {
        "*" = {
          background-primary = mkLiteral "#${config.lib.stylix.colors.base00}";
          background-secondary = mkLiteral "#${config.lib.stylix.colors.base01}";
          border-color = mkLiteral "#${config.lib.stylix.colors.base01}";
          selected-background = mkLiteral "#${config.lib.stylix.colors.base01}";
          foreground-primary = mkLiteral "#${config.lib.stylix.colors.base05}";
          muted-foreground = mkLiteral "#${config.lib.stylix.colors.base03}";
          highlight = mkLiteral "#${config.lib.stylix.colors.base0D}";
          accent-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
        };

        "*" = {
          width = mkLiteral "600";
          border-radius = mkLiteral "15px";
        };

        "element-text, element-icon , mode-switcher" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "window" = {
          height = mkLiteral "360px";
          border = mkLiteral "2px";
          border-color = mkLiteral "@accent-color";
          background-color = mkLiteral "@background-primary";
        };

        "mainbox" = {
          background-color = mkLiteral "@background-primary";
        };

        "inputbar" = {
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
          background-color = mkLiteral "@background-primary";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "2px";
        };

        "prompt" = {
          background-color = mkLiteral "@highlight";
          padding = mkLiteral "6px";
          text-color = mkLiteral "@background-primary";
          border-radius = mkLiteral "3px";
          margin = mkLiteral "20px 0px 0px 20px";
        };

        "textbox-prompt-colon" = {
          expand = mkLiteral "false";
          str = mkLiteral ''":"'';
        };

        "entry" = {
          padding = mkLiteral "6px";
          margin = mkLiteral "20px 0px 0px 10px";
          text-color = mkLiteral "@foreground-primary";
          background-color = mkLiteral "@background-primary";
        };

        "listview" = {
          border = mkLiteral "0px 0px 0px";
          padding = mkLiteral "6px 0px 0px";
          margin = mkLiteral "10px 0px 0px 20px";
          columns = mkLiteral "2";
          lines = mkLiteral "5";
          background-color = mkLiteral "@background-primary";
        };

        "element" = {
          padding = mkLiteral "5px";
          background-color = mkLiteral "@background-primary";
          text-color = mkLiteral "@foreground-primary";
        };

        "element-icon" = {
          size = mkLiteral "25px";
        };

        "element selected" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@accent-color";
        };

        "mode-switcher" = {
          spacing = mkLiteral "0";
        };

        "button" = {
          padding = mkLiteral "10px";
          background-color = mkLiteral "@background-secondary";
          text-color = mkLiteral "@muted-foreground";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.5";
        };

        "button selected" = {
          background-color = mkLiteral "@background-primary";
          text-color = mkLiteral "@highlight";
        };

        "message" = {
          background-color = mkLiteral "@background-secondary";
          margin = mkLiteral "2px";
          padding = mkLiteral "2px";
          border-radius = mkLiteral "5px";
        };

        "textbox" = {
          padding = mkLiteral "6px";
          margin = mkLiteral "20px 0px 0px 20px";
          text-color = mkLiteral "@highlight";
          background-color = mkLiteral "@background-secondary";
        };
      };
  };
}
