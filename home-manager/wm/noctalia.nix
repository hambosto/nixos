{ config, ... }: {
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    customPalettes.stylix =
      let
        roles = with config.lib.stylix.colors.withHashtag; {
          mPrimary = base0D;
          mOnPrimary = base00;
          mSecondary = base0E;
          mOnSecondary = base00;
          mTertiary = base0C;
          mOnTertiary = base00;
          mError = base08;
          mOnError = base00;
          mSurface = base00;
          mOnSurface = base05;
          mHover = base0C;
          mOnHover = base00;
          mSurfaceVariant = base01;
          mOnSurfaceVariant = base04;
          mOutline = base03;
          mShadow = base00;

          terminal = {
            foreground = base05;
            background = base00;
            cursor = base05;
            cursorText = base00;
            selectionFg = base05;
            selectionBg = base02;
            normal = {
              black = base00;
              red = base08;
              green = base0B;
              yellow = base0A;
              blue = base0D;
              magenta = base0E;
              cyan = base0C;
              white = base05;
            };
            bright = {
              black = base03;
              red = base08;
              green = base0B;
              yellow = base0A;
              blue = base0D;
              magenta = base0E;
              cyan = base0C;
              white = base07;
            };
          };
        };
      in
      {
        dark = roles;
        light = roles;
      };
    settings = {
      bar.default = {
        background_opacity = config.stylix.opacity.desktop;
        capsule = true;
        capsule_opacity = config.stylix.opacity.desktop;
        capsule_radius = 10;
        capsule_group = [
          {
            fill = "surface_variant";
            id = "g1";
            members = [
              "media"
              "audio_visualizer"
            ];
            opacity = config.stylix.opacity.desktop;
            padding = 6.0;
            radius = 10.0;
          }
        ];
        center = [ "group:g1" ];
        end = [
          "tray"
          "network"
          "volume"
          "brightness"
          "battery"
          "clock"
          "control-center"
          "notifications"
          "session"
        ];
        margin_edge = 5;
        margin_ends = 180;
        radius = 10;
        start = [
          "launcher"
          "workspaces"
          "active_window"
        ];
      };

      desktop_widgets = {
        enabled = false;
      };

      dock = {
        background_opacity = config.stylix.opacity.desktop;
      };

      idle = {
        behavior_order = [
          "screen-off"
          "lock-and-suspend"
          "lock"
        ];

        behavior.lock = {
          action = "lock";
          enabled = false;
          timeout = 600;
        };

        behavior.lock-and-suspend = {
          action = "lock_and_suspend";
          enabled = false;
          timeout = 900;
        };

        behavior.screen-off = {
          action = "screen_off";
          enabled = false;
          timeout = 660;
        };
      };

      location = {
        address = "Malang, Indonesia";
      };

      lockscreen = {
        fingerprint = false;
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ "lockscreen-login-box@eDP-1" ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget = {
          "lockscreen-login-box@eDP-1" = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 960.0;
            cy = 1077.0;
            output = "eDP-1";
            rotation = 0.0;
            type = "login_box";

            settings = {
              background_color = "surface_variant";
              background_opacity = config.stylix.opacity.desktop;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };
        };
      };

      notification = {
        background_opacity = config.stylix.opacity.popups;
      };

      osd = {
        background_opacity = config.stylix.opacity.popups;
        orientation = "vertical";
        position = "center_right";
      };

      shell = {
        app_icon_colorize = false;
        clipboard_enabled = false;
        font_family = config.stylix.fonts.sansSerif.name;
        lang = "en";
        launch_apps_as_systemd_services = true;
        polkit_agent = false;
        settings_show_advanced = true;

        panel = {
          control_center_placement = "attached";
          launcher_categories = false;
          launcher_sort_by_usage = false;
          session_placement = "centered";
          transparency_mode = "glass";
        };

        screenshot = {
          copy_to_clipboard = false;
          freeze_screen = false;
          save_to_file = false;
        };
      };

      theme = {
        custom_palette = "stylix";
        mode = "dark";
        source = "custom";
      };

      wallpaper = {
        enabled = false;
      };

      widget.launcher = {
        glyph = "background";
      };

      widget.media = {
        art_size = 19.0;
        hide_when_no_media = true;
        max_length = 150;
        title_scroll = "always";
      };

      widget.network = {
        show_label = true;
      };

      widget.workspaces = {
        display = "none";
        empty_color = "secondary";
        occupied_color = "secondary";
      };
    };
  };
}
