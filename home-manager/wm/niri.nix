{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.niri.settings = {
    binds = with config.lib.niri.actions; {
      "Mod+Return".action = spawn "${lib.getExe pkgs.kitty}" "--title" "kitty";
      "Mod+E".action = spawn "${lib.getExe pkgs.kitty}" "-e" "${lib.getExe pkgs.yazi}";
      "Mod+Space".action = spawn "${lib.getExe pkgs.rofi}" "-show" "drun";
      "Mod+L".action = spawn "${lib.getExe pkgs.hyprlock}";
      "Mod+Shift+M".action = spawn "${lib.getExe pkgs.kitty}" "-e" "${lib.getExe pkgs.btop}";
      "Mod+Shift+P".action = spawn "${lib.getExe pkgs.wlogout}";

      "Print".action.screenshot-screen.write-to-disk = true;
      "Mod+Print".action.screenshot-window = [ ];
      "Mod+Shift+Print".action.screenshot.show-pointer = false;

      "Mod+Q".action = close-window;
      "Mod+F".action = fullscreen-window;
      "Mod+M".action = maximize-column;
      "Mod+T".action = toggle-window-floating;
      "Mod+W".action = toggle-overview;

      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;

      "Mod+Shift+Left".action = move-column-left;
      "Mod+Shift+Right".action = move-column-right;
      "Mod+Shift+Up".action = move-window-up;
      "Mod+Shift+Down".action = move-window-down;

      "Mod+Ctrl+Left".action = set-column-width "-10%";
      "Mod+Ctrl+Right".action = set-column-width "+10%";
      "Mod+Ctrl+Up".action = set-window-height "-10%";
      "Mod+Ctrl+Down".action = set-window-height "+10%";

      "Mod+Alt+Down".action = move-column-to-workspace-down;
      "Mod+Alt+Up".action = move-column-to-workspace-up;

      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
      "Mod+0".action = focus-workspace 10;

      "Mod+WheelScrollDown".action = focus-workspace-down;
      "Mod+WheelScrollUp".action = focus-workspace-up;

      "Mod+Shift+1".action.move-window-to-workspace = 1;
      "Mod+Shift+2".action.move-window-to-workspace = 2;
      "Mod+Shift+3".action.move-window-to-workspace = 3;
      "Mod+Shift+4".action.move-window-to-workspace = 4;
      "Mod+Shift+5".action.move-window-to-workspace = 5;
      "Mod+Shift+6".action.move-window-to-workspace = 6;
      "Mod+Shift+7".action.move-window-to-workspace = 7;
      "Mod+Shift+8".action.move-window-to-workspace = 8;
      "Mod+Shift+9".action.move-window-to-workspace = 9;
      "Mod+Shift+0".action.move-window-to-workspace = 10;

      "XF86AudioRaiseVolume" = {
        action =
          spawn "${lib.getExe' pkgs.wireplumber "wpctl"}" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+" "-l"
            "1";
        allow-when-locked = true;
      };

      "XF86AudioLowerVolume" = {
        action = spawn "${lib.getExe' pkgs.wireplumber "wpctl"}" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
        allow-when-locked = true;
      };

      "XF86AudioMute" = {
        action = spawn "${lib.getExe' pkgs.wireplumber "wpctl"}" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        allow-when-locked = true;
      };

      "XF86AudioMicMute" = {
        action =
          spawn "${lib.getExe' pkgs.wireplumber "wpctl"}" "set-mute" "@DEFAULT_AUDIO_SOURCE@"
            "toggle";
        allow-when-locked = true;
      };

      "XF86MonBrightnessUp" = {
        action = spawn "${lib.getExe pkgs.brightnessctl}" "set" "+5%";
        allow-when-locked = true;
      };

      "XF86MonBrightnessDown" = {
        action = spawn "${lib.getExe pkgs.brightnessctl}" "set" "5%-";
        allow-when-locked = true;
      };
    };

    cursor = {
      size = config.stylix.cursor.size;
      theme = config.stylix.cursor.name;
    };

    environment = {
      CLUTTER_BACKEND = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      GDK_BACKEND = "wayland,x11";
      GDK_SCALE = "1";
      MOZ_ENABLE_WAYLAND = "1";
      OZONE_PLATFORM = "wayland";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_DESKTOP = "niri";
      XDG_SESSION_TYPE = "wayland";
    };

    gestures.hot-corners.enable = true;
    hotkey-overlay.skip-at-startup = true;

    input = {
      focus-follows-mouse.enable = true;
      keyboard.xkb.layout = "us";
      mouse.natural-scroll = false;

      touchpad = {
        natural-scroll = true;
        scroll-factor = 1.0;
        tap = true;
      };

      warp-mouse-to-focus.enable = true;
      workspace-auto-back-and-forth = true;
    };

    layer-rules = [
      {
        matches = [ { namespace = "^awww-daemon$"; } ];
        place-within-backdrop = true;
      }
    ];

    layout = {
      always-center-single-column = true;
      background-color = "transparent";
      default-column-width.proportion = 0.5;
      focus-ring.enable = false;
      gaps = 6;
      shadow.enable = false;

      border = with config.lib.stylix.colors.withHashtag; {
        enable = true;
        width = 2;
        active.color = base0D;
        inactive.color = base03;
      };

      preset-column-widths = [
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

    outputs = {
      "eDP-1" = {
        scale = 1.0;
        position = {
          x = 0;
          y = 0;
        };
      };
    };

    overview.workspace-shadow.enable = false;
    prefer-no-csd = true;
    screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";
    spawn-at-startup = [
      {
        command = [
          "${lib.getExe pkgs.awww}"
          "img"
          "${config.stylix.image}"
        ];
      }
    ];

    window-rules = [
      {
        clip-to-geometry = true;
        draw-border-with-background = false;
        geometry-corner-radius = {
          bottom-left = 5.0;
          bottom-right = 5.0;
          top-left = 5.0;
          top-right = 5.0;
        };
      }
      {
        matches = [
          { title = "^Open File.*$"; }
          { title = "^Select a File.*$"; }
          { title = "^Choose wallpaper.*$"; }
          { title = "^Open Folder.*$"; }
          { title = "^Save As.*$"; }
          { title = "^File Upload.*$"; }
        ];
        default-column-width.fixed = 800;
        default-window-height.fixed = 600;
        open-floating = true;
      }
    ];

    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite-unstable;
    };
  };
}
