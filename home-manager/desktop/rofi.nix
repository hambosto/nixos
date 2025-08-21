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
      disable-history = true;
      display-drun = " Apps";
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      lib.mkForce {
        "*" = {
          wallpaper = mkLiteral ''url("${config.stylix.image}", width)'';
        };
        "window" = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = mkLiteral "false";
          width = mkLiteral "500px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";

          enabled = mkLiteral "true";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "20px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0E}";
          cursor = "default";
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}E6";
        };
        "mainbox" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "0px";
          background-color = mkLiteral "transparent";
          orientation = mkLiteral "vertical";
          children = map mkLiteral [
            "inputbar"
            "listbox"
          ];
        };
        "listbox" = {
          spacing = mkLiteral "20px";
          padding = mkLiteral "20px";
          background-color = mkLiteral "transparent";
          orientation = mkLiteral "vertical";
          children = map mkLiteral [
            "message"
            "listview"
          ];
        };
        "inputbar" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          padding = mkLiteral "50px 30px";
          background-color = mkLiteral "transparent";
          background-image = mkLiteral "@wallpaper";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          orientation = mkLiteral "horizontal";
          children = map mkLiteral [
            "textbox-prompt-colon"
            "entry"
            "dummy"
            "mode-switcher"
          ];
        };
        "textbox-prompt-colon" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          str = "";
          padding = mkLiteral "12px 15px";
          border-radius = mkLiteral "100%";
          background-color = mkLiteral "#${config.lib.stylix.colors.base02}CC";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };
        "entry" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          width = mkLiteral "250px";
          padding = mkLiteral "12px 16px";
          border-radius = mkLiteral "100%";
          background-color = mkLiteral "#${config.lib.stylix.colors.base02}CC";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          cursor = mkLiteral "text";
          placeholder = "Search";
          placeholder-color = mkLiteral "#${config.lib.stylix.colors.base03}";
        };
        "dummy" = {
          expand = mkLiteral "true";
          background-color = mkLiteral "transparent";
        };
        "mode-switcher" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };
        "button" = {
          width = mkLiteral "90px";
          padding = mkLiteral "12px";
          border-radius = mkLiteral "100%";
          background-color = mkLiteral "#${config.lib.stylix.colors.base02}AA";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          cursor = mkLiteral "pointer";
        };
        "button selected" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0E}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };
        "listview" = {
          enabled = mkLiteral "true";
          columns = mkLiteral "1";
          lines = mkLiteral "6";
          cycle = mkLiteral "false";
          dynamic = mkLiteral "true";
          scrollbar = mkLiteral "false";
          layout = mkLiteral "vertical";
          reverse = mkLiteral "false";
          fixed-height = mkLiteral "true";
          fixed-columns = mkLiteral "true";
          spacing = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          cursor = "default";
        };
        "element" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          padding = mkLiteral "12px";
          border-radius = mkLiteral "15px";
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}80";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}60";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };
        "element normal.urgent" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base08}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };
        "element normal.active" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };
        "element selected.normal" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0E}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };
        "element selected.urgent" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base08}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base07}";
        };
        "element selected.active" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };
        "element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "48px";
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
        "message" = {
          background-color = mkLiteral "transparent";
        };
        "textbox" = {
          padding = mkLiteral "15px";
          border-radius = mkLiteral "15px";
          background-color = mkLiteral "#${config.lib.stylix.colors.base02}CC";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
        "error-message" = {
          padding = mkLiteral "15px";
          border-radius = mkLiteral "15px";
          background-color = mkLiteral "#${config.lib.stylix.colors.base08}CC";
          text-color = mkLiteral "#${config.lib.stylix.colors.base07}";
        };
      };
  };
}
