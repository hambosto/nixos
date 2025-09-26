{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = config.wayland.windowManager.hyprland.enable;
    package = pkgs.rofi;
    extraConfig = {
      font = "Ubuntu Nerd Font 14";
      modi = "drun,run,filebrowser,window";
      show-icons = true;
      display-drun = "";
      display-run = "";
      display-filebrowser = "";
      display-window = "";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
      disable-history = true;
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      lib.mkForce {

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
            "message"
            "listview"
          ];
        };

        "inputbar" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          children = map mkLiteral [
            "textbox-prompt-colon"
            "entry"
            "mode-switcher"
          ];
        };

        "prompt" = {
          enabled = mkLiteral "true";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
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

        "num-filtered-rows" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "textbox-num-sep" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          str = "/";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "num-rows" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "case-indicator" = {
          enabled = mkLiteral "true";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "listview" = {
          enabled = mkLiteral "true";
          columns = mkLiteral "1";
          lines = mkLiteral "8";
          cycle = mkLiteral "true";
          dynamic = mkLiteral "true";
          scrollbar = mkLiteral "true";
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

        "scrollbar" = {
          handle-width = mkLiteral "5px";
          handle-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          border-radius = mkLiteral "10px";
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}";
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

        "element normal.urgent" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base08}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element normal.active" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0B}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element selected.normal" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element selected.urgent" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0B}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element selected.active" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base08}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element alternate.normal" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

        "element alternate.urgent" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base08}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element alternate.active" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0B}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base00}";
        };

        "element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "24px";
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

        "mode-switcher" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

        "button" = {
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "pointer";
        };

        "button selected" = {
          background-color = "#${config.lib.stylix.colors.base0D}";
          text-color = "#${config.lib.stylix.colors.base00}";
        };

        "message" = {
          enabled = mkLiteral "true";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

        "textbox" = {
          padding = mkLiteral "8px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          highlight = mkLiteral "none";
          placeholder-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          blink = mkLiteral "true";
          markup = mkLiteral "true";
        };

        "error-message" = {
          padding = mkLiteral "10px";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

      };
  };
}
