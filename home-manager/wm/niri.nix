{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.niri = {
    enable = true;
    settings = {
      binds = {
        "Mod+Return".spawn = [ (lib.getExe pkgs.kitty) ];

        "Mod+E".spawn = [
          (lib.getExe pkgs.kitty)
          "-e"
          (lib.getExe pkgs.yazi)
        ];

        "Mod+Space".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "panel-toggle"
          "launcher"
        ];

        "Mod+S".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "panel-toggle"
          "control-center"
        ];

        "Mod+Comma".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "settings-toggle"
        ];

        "Mod+Shift+M".spawn = [
          (lib.getExe pkgs.kitty)
          "-e"
          (lib.getExe pkgs.btop)
        ];

        "Print".screenshot-screen._props.write-to-disk = true;
        "Mod+Print".screenshot-window = { };
        "Mod+Shift+Print".screenshot._props.show-pointer = false;

        "Mod+Q".close-window = { };
        "Mod+F".fullscreen-window = { };
        "Mod+M".maximize-column = { };
        "Mod+T".toggle-window-floating = { };
        "Mod+O".toggle-overview = { };
        "Mod+W".toggle-column-tabbed-display = { };

        "Mod+Left".focus-column-left = { };
        "Mod+Right".focus-column-right = { };
        "Mod+Up".focus-window-up = { };
        "Mod+Down".focus-window-down = { };
        "Mod+H".focus-column-left = { };
        "Mod+L".focus-column-right = { };
        "Mod+J".focus-window-down = { };
        "Mod+K".focus-window-up = { };

        "Mod+BracketLeft".consume-or-expel-window-left = { };
        "Mod+BracketRight".consume-or-expel-window-right = { };

        "Mod+Ctrl+Left".move-column-left = { };
        "Mod+Ctrl+Right".move-column-right = { };
        "Mod+Ctrl+Up".move-window-up = { };
        "Mod+Ctrl+Down".move-window-down = { };

        "Mod+Shift+Left".set-column-width = "-10%";
        "Mod+Shift+Right".set-column-width = "+10%";
        "Mod+Shift+Up".set-window-height = "-10%";
        "Mod+Shift+Down".set-window-height = "+10%";

        "Mod+Alt+Down".move-column-to-workspace-down = { };
        "Mod+Alt+Up".move-column-to-workspace-up = { };

        "Mod+1".focus-workspace = 1;
        "Mod+2".focus-workspace = 2;
        "Mod+3".focus-workspace = 3;
        "Mod+4".focus-workspace = 4;
        "Mod+5".focus-workspace = 5;
        "Mod+6".focus-workspace = 6;
        "Mod+7".focus-workspace = 7;
        "Mod+8".focus-workspace = 8;
        "Mod+9".focus-workspace = 9;
        "Mod+0".focus-workspace = 10;

        "Mod+WheelScrollDown".focus-workspace-down = { };
        "Mod+WheelScrollUp".focus-workspace-up = { };

        "Mod+Shift+1".move-window-to-workspace = 1;
        "Mod+Shift+2".move-window-to-workspace = 2;
        "Mod+Shift+3".move-window-to-workspace = 3;
        "Mod+Shift+4".move-window-to-workspace = 4;
        "Mod+Shift+5".move-window-to-workspace = 5;
        "Mod+Shift+6".move-window-to-workspace = 6;
        "Mod+Shift+7".move-window-to-workspace = 7;
        "Mod+Shift+8".move-window-to-workspace = 8;
        "Mod+Shift+9".move-window-to-workspace = 9;
        "Mod+Shift+0".move-window-to-workspace = 10;

        "XF86AudioRaiseVolume".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "volume-up"
        ];

        "XF86AudioLowerVolume".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "volume-down"
        ];

        "XF86AudioMute".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "volume-mute"
        ];

        "XF86AudioMicMute".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "mic-mute"
        ];

        "XF86MonBrightnessUp".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "brightness-up"
        ];

        "XF86MonBrightnessDown".spawn = [
          (lib.getExe pkgs.noctalia)
          "msg"
          "brightness-down"
        ];
      };

      blur = {
        offset = 3.0;
        noise = 0.02;
        passes = 3;
        saturation = 1.5;
      };

      cursor = {
        xcursor-size = config.stylix.cursor.size;
        xcursor-theme = config.stylix.cursor.name;
      };

      environment = {
        "CLUTTER_BACKEND" = "wayland";
        "ELECTRON_OZONE_PLATFORM_HINT" = "wayland";
        "GDK_BACKEND" = "wayland,x11";
        "GDK_SCALE" = "1";
        "MOZ_ENABLE_WAYLAND" = "1";
        "OZONE_PLATFORM" = "wayland";
        "QT_AUTO_SCREEN_SCALE_FACTOR" = "1";
        "QT_QPA_PLATFORM" = "wayland";
        "QT_QPA_PLATFORMTHEME" = "qt6ct";
        "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
        "XDG_CURRENT_DESKTOP" = "niri";
        "XDG_SESSION_DESKTOP" = "niri";
        "XDG_SESSION_TYPE" = "wayland";
      };

      hotkey-overlay.skip-at-startup = { };

      input = {
        focus-follows-mouse = { };
        keyboard = {
          repeat-delay = 600;
          repeat-rate = 25;
          track-layout = "global";
          xkb = {
            layout = "us";
            model = "";
            rules = "";
            variant = "";
          };
        };
        touchpad = {
          natural-scroll = { };
          scroll-factor = 1.0;
          tap = { };
        };
        warp-mouse-to-focus = { };
        workspace-auto-back-and-forth = { };
      };

      layer-rule = {
        match._props.namespace = "^wallpaper-rs$";
        place-within-backdrop = true;
      };

      layout = with config.lib.stylix.colors.withHashtag; {
        always-center-single-column = { };
        background-color = "transparent";
        border = {
          active-color = base0D;
          inactive-color = base03;
          width = 2;
        };
        center-focused-column = "never";
        default-column-width.proportion = 0.5;
        focus-ring.off = { };
        gaps = 6;
        preset-column-widths._children = [
          { proportion = 0.25; }
          { proportion = 0.5; }
          { proportion = 0.75; }
          { proportion = 1.0; }
        ];
        struts = {
          bottom = 0;
          left = 0;
          right = 0;
          top = 0;
        };
      };

      output = {
        _args = [ "eDP-1" ];
        position = {
          _props = {
            x = 0;
            y = 0;
          };
        };
        scale = 1.0;
        transform = "normal";
      };

      overview.workspace-shadow.off = { };

      prefer-no-csd = { };

      recent-windows = with config.lib.stylix.colors.withHashtag; {
        debounce-ms = 0;
        highlight = {
          active-color = base02;
          corner-radius = 10;
          padding = 5;
          urgent-color = base0F;
        };
        open-delay-ms = 0;
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";

      xwayland-satellite.path = (lib.getExe pkgs.xwayland-satellite-unstable);

      _children = [
        {
          window-rule = {
            clip-to-geometry = true;
            draw-border-with-background = false;
            geometry-corner-radius._args = [
              10.0
              10.0
              10.0
              10.0
            ];
          };
        }
        {
          window-rule._children = [
            { match._props.title = "^Open File.*$"; }
            { match._props.title = "^Select a File.*$"; }
            { match._props.title = "^Open Folder.*$"; }
            { match._props.title = "^Save As.*$"; }
            { match._props.title = "^File Upload.*$"; }
            { default-column-width.fixed = 800; }
            { default-window-height.fixed = 600; }
            { open-floating = true; }
          ];
        }
      ];
    };
  };
}
