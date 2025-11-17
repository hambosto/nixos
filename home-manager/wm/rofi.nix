{ config, ... }:
{
  programs.rofi = {
    enable = true;
    extraConfig = {
      font = "Ubuntu Nerd Font 14";
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      disable-history = true;
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "window" = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = mkLiteral "false";
          width = mkLiteral "600px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";
          enabled = mkLiteral "true";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "5px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          cursor = "default";
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "mainbox" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "30px";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "5px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "transparent";
          children = map mkLiteral [
            "inputbar"
            "listview"
          ];
        };

        "inputbar" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          children = map mkLiteral [
            "textbox-prompt-colon"
            "entry"
          ];
        };

        "textbox-prompt-colon" = {
          enabled = mkLiteral "true";
          padding = mkLiteral "5px 0px";
          expand = mkLiteral "false";
          str = "";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "entry" = {
          enabled = mkLiteral "true";
          padding = mkLiteral "5px 0px";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search...";
          placeholder-color = mkLiteral "inherit";
        };

        "listview" = {
          enabled = mkLiteral "true";
          columns = mkLiteral "1";
          lines = mkLiteral "8";
          cycle = mkLiteral "true";
          dynamic = mkLiteral "true";
          scrollbar = mkLiteral "false";
          layout = mkLiteral "vertical";
          reverse = mkLiteral "false";
          fixed-height = mkLiteral "true";
          fixed-columns = mkLiteral "true";
          spacing = mkLiteral "5px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          cursor = "default";
        };

        "element" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          cursor = mkLiteral "pointer";
        };

        "element normal.normal" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

        "element selected.normal" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element alternate.normal" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

        "element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "32px";
          cursor = mkLiteral "inherit";
        };

        "element-text" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
      };
  };
}
