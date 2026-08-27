{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.umbriel = {
    enable = true;
    settings = {
      animation = {
        border = {
          curve = "easeout";
          duration_ms = 250; # 1-10000
          enabled = false;
        };
        curve = "easeout";
        dim_unfocused = {
          curve = "easeout";
          dim = 0; # 0.0-1.0
          duration_ms = 250;
          enabled = false;
        };
        duration_ms = 250;
        enabled = true;
        layers = {
          curve = "easeout";
          duration_ms = 250;
          enabled = false;
        };
        overview = {
          curve = "easeout";
          duration_ms = 250;
          enabled = true;
        };
        scratchpad = {
          blur = false;
          curve = "easeout";
          dim = 0.5; # 0.0-1.0
          duration_ms = 250;
          enabled = false;
          fullscreen = false;
          maximize = false;
          scale = 0; # 0 preserves the window geometry
        };
        windows_in = {
          curve = "easeout";
          duration_ms = 150;
          enabled = true;
          scale = 0.85;
          style = "popin"; # popin, zoom, slide, fade, none
        };
        windows_move = {
          curve = "snappy";
          duration_ms = 250;
          enabled = true;
        };
        windows_out = {
          curve = "easeout";
          duration_ms = 150;
          enabled = true;
          style = "fade"; # fade, slide
        };
        workspaces = {
          curve = "easeout";
          duration_ms = 250;
          enabled = true;
        };
      };
      appearance = with config.lib.stylix.colors.withHashtag; {
        backdrop_color = "${base00}FF";
        blur = {
          brightness = 0.9;
          contrast = 0.9;
          enabled = true;
          noise = 0.02;
          optimized = true;
          passes = 3;
          radius = 3;
          saturation = 1.1;
        };
        border_focused = "${base0D}FF";
        border_unfocused = "${base03}FF";
        border_width = 2;
        corner_radius = 10;
        outer_border_color = "${base01}FF";
        outer_border_width = 0;
        prefer_no_csd = true;
        scratchpad_border_focused = "${base0A}FF";
        scratchpad_border_unfocused = "${base02}FF";
      };
      environment = {
        CLUTTER_BACKEND = "wayland";
        DESKTOP_SESSION = "umbriel";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        GDK_BACKEND = "wayland,x11";
        GDK_SCALE = "1";
        MOZ_ENABLE_WAYLAND = "1";
        OZONE_PLATFORM = "wayland";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
        XDG_CURRENT_DESKTOP = "umbriel";
        XDG_SESSION_DESKTOP = "umbriel";
        XDG_SESSION_TYPE = "wayland";
      };
      colors = with config.lib.stylix.colors.withHashtag; {
        background = "${base00}F0";
        text_primary = "${base05}FF";
        text_muted = "${base03}FF";
        accent_primary = "${base0D}FF";
        accent_secondary = "${base0C}FF";
        warning = "${base0A}FF";
        error = "${base08}FF";
      };
      general = {
        mod_key = "Super";
        show_cheatsheet = false;
        xwayland = true;
      };
      hot_corners = {
        top_left = {
          action = "overview-open";
          delay_ms = 1;
          enabled = true;
        };
        top_right = {
          action = "overview-close";
          delay_ms = 1;
          enabled = true;
        };
      };

      input = {
        cursor = {
          size = config.stylix.cursor.size;
          theme = config.stylix.cursor.name;
        };
        focus.follows_mouse = true;
        keyboard = {
          layout = "us";
          repeat_delay = 600;
          repeat_rate = 25;
        };
        mouse.natural_scroll = false;
        touchpad = {
          natural_scroll = true;
          tap = true;
        };
      };
      keybinds = {
        "Mod+Space" = "spawn:${lib.getExe pkgs.noctalia} msg panel-toggle launcher";
        "Mod+Return" = "spawn:${lib.getExe pkgs.kitty}";
        "Mod+Escape" = "spawn:${lib.getExe pkgs.noctalia} msg panel-toggle session";

        "Mod+E" = "spawn:${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.yazi}";
        "Mod+B" = "spawn:${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.btop}";

        "Mod+Q" = "window-close";
        "Mod+F" = "window-toggle-fullscreen";
        "Mod+M" = "window-toggle-maximize";
        "Mod+V" = "window-toggle-floating";
        "Mod+P" = "window-toggle-pinned";
        "Mod+Tab" = "window-focus-next";

        "Mod+Left" = "window-focus-left";
        "Mod+Right" = "window-focus-right";
        "Mod+Up" = "window-focus-up";
        "Mod+Down" = "window-focus-down";

        "Mod+Ctrl+Left" = "column-move-left";
        "Mod+Ctrl+Right" = "column-move-right";
        "Mod+Ctrl+Up" = "window-move-up";
        "Mod+Ctrl+Down" = "window-move-down";

        "Mod+Comma" = "window-consume-left";
        "Mod+Period" = "window-expel-right";
        "Mod+C" = "column-center";
        "Mod+Shift+C" = "window-center";

        "Mod+Shift+Left" = "window-modify-width:-0.1";
        "Mod+Shift+Right" = "window-modify-width:0.1";

        "Mod+Ctrl+K" = "layout-scroll-up";
        "Mod+Ctrl+J" = "layout-scroll-down";

        "Mod+Alt+Left" = "output-focus-left";
        "Mod+Alt+Right" = "output-focus-right";
        "Mod+Alt+Up" = "output-focus-up";
        "Mod+Alt+Down" = "output-focus-down";

        "Mod+0" = "workspace-switch:10";
        "Mod+1" = "workspace-switch:1";
        "Mod+2" = "workspace-switch:2";
        "Mod+3" = "workspace-switch:3";
        "Mod+4" = "workspace-switch:4";
        "Mod+5" = "workspace-switch:5";
        "Mod+6" = "workspace-switch:6";
        "Mod+7" = "workspace-switch:7";
        "Mod+8" = "workspace-switch:8";
        "Mod+9" = "workspace-switch:9";

        "Mod+Shift+0" = "window-move-to-workspace:10";
        "Mod+Shift+1" = "window-move-to-workspace:1";
        "Mod+Shift+2" = "window-move-to-workspace:2";
        "Mod+Shift+3" = "window-move-to-workspace:3";
        "Mod+Shift+4" = "window-move-to-workspace:4";
        "Mod+Shift+5" = "window-move-to-workspace:5";
        "Mod+Shift+6" = "window-move-to-workspace:6";
        "Mod+Shift+7" = "window-move-to-workspace:7";
        "Mod+Shift+8" = "window-move-to-workspace:8";
        "Mod+Shift+9" = "window-move-to-workspace:9";

        "Mod+O" = "overview-toggle";

        "Mod+WheelUp" = "window-modify-width:0.1";
        "Mod+WheelDown" = "window-modify-width:-0.1";
        "Mod+Shift+WheelUp" = "workspace-previous";
        "Mod+Shift+WheelDown" = "workspace-next";

        "Mod+Slash" = "cheatsheet-toggle";

        "Print" = "spawn:${lib.getExe pkgs.noctalia} msg screenshot-region";
        "Shift+Print" = "spawn:${lib.getExe pkgs.noctalia} msg screenshot-fullscreen";

        "Mod+S" = "window-toggle-scratchpad";
        "Mod+Shift+S" = "scratchpad-toggle";
        "Mod+Ctrl+S" = "scratchpad-focus-next";

        "XF86AudioLowerVolume" = "spawn:${lib.getExe pkgs.noctalia} msg volume-down";
        "XF86AudioMicMute" = "spawn:${lib.getExe pkgs.noctalia} msg mic-mute";
        "XF86AudioMute" = "spawn:${lib.getExe pkgs.noctalia} msg volume-mute";
        "XF86AudioRaiseVolume" = "spawn:${lib.getExe pkgs.noctalia} msg volume-up";
        "XF86MonBrightnessDown" = "spawn:${lib.getExe pkgs.noctalia} msg brightness-down";
        "XF86MonBrightnessUp" = "spawn:${lib.getExe pkgs.noctalia} msg brightness-up";
      };
      layer_rule = [
        {
          blur = true;
          blur_ignore_alpha = 0.5;
          blur_optimized = false;
          match = {
            namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";
          };
        }
      ];
      layout = {
        gap = 6;
        mode = "scrolling";
        scrolling = {
          center_underfull_strip = true;
          default_width_fraction = 0.5;
          direction = "horizontal";
        };
        width_presets = [
          0.25
          0.5
          0.75
          1.0
        ];
      };
      output = {
        eDP-1 = {
          position = [
            0
            0
          ];
          scale = 1;
          transform = "normal";
        };
      };
      window_rule = [
        {
          blur = true;
          blur_optimized = true;
        }
        {
          default_floating = true;
          default_size = [
            800
            600
          ];
          match.title = "^Open File.*$";
        }
        {
          default_floating = true;
          default_size = [
            800
            600
          ];
          match.title = "^Select a File.*$";
        }
        {
          default_floating = true;
          default_size = [
            800
            600
          ];
          match.title = "^Open Folder.*$";
        }
        {
          default_floating = true;
          default_size = [
            800
            600
          ];
          match.title = "^Save As.*$";
        }
        {
          default_floating = true;
          default_size = [
            800
            600
          ];
          match.title = "^File Upload.*$";
        }
        {
          default_floating = true;
          default_position = {
            anchor = "top_right";
            x = 32;
            y = 32;
          };
          default_size = [
            480
            270
          ];
          match.title = "^Picture in picture.*$";
        }
        {
          blur = true;
          blur_popups = false;
          default_floating = true;
          default_size = [
            1080
            920
          ];
          match.app_id = "^dev.noctalia.Noctalia$";
        }
        {
          default_floating = true;
          default_size = [
            800
            600
          ];
          match = {
            app_id = "^dev.noctalia.UmbrielSharePicker$";
          };
        }

      ];
      workspaces.back_and_forth = true;
    };
  };
}
