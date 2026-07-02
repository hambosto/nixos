{ config, lib, ... }:
{
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
        font_weight = 700;
        margin_edge = 5;
        margin_ends = 6;
        radius = 10;
        start = [
          "launcher"
          "workspaces"
          "active_window"
        ];
        capsule_group = [
          {
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
      };

      desktop_widgets.enabled = false;
      dock.background_opacity = config.stylix.opacity.desktop;

      idle = {
        behavior_order = [
          "screen-off"
          "lock-and-suspend"
          "lock"
        ];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
          };
        };
      };

      location.address = "Malang, Indonesia";

      lockscreen = {
        fingerprint = false;
        wallpaper = config.stylix.image;
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
        widget."lockscreen-login-box@eDP-1" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 960.0;
          cy = 1077.0;
          output = "eDP-1";
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_opacity = config.stylix.opacity.desktop;
            background_radius = 12.0;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_login_button = true;
          };
        };
      };

      notification.background_opacity = config.stylix.opacity.popups;

      osd = {
        background_opacity = config.stylix.opacity.popups;
        orientation = "vertical";
        position = "center_right";
        position_vertical = "center_right";
      };

      plugins.source = [
        {
          enabled = false;
          kind = "git";
          location = "https://github.com/noctalia-dev/official-plugins";
          name = "official";
        }
        {
          enabled = false;
          kind = "git";
          location = "https://github.com/noctalia-dev/community-plugins";
          name = "community";
        }
      ];

      shell = {
        avatar_path = ../../assets/profile-picture.jpg;
        clipboard_enabled = false;
        font_family = config.stylix.fonts.monospace.name;
        lang = "en";
        launch_apps_as_systemd_services = true;
        polkit_agent = false;
        settings_show_advanced = true;

        launcher.sort_by_usage = false;

        panel = {
          control_center_placement = "attached";
          launcher_placement = "attached";
          session_placement = "attached";
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

      wallpaper.enabled = false;

      widget = {
        audio_visualizer = {
          bands = 20;
          width = 90.0;
        };
        control-center.glyph = "settings-2";
        launcher.glyph = "snowflake";
        media = {
          hide_when_no_media = true;
          title_scroll = "always";
        };
        network.show_label = true;
        workspaces.display = "none";
      };
    };
  };

  home.activation.removeStaleFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    for path in \
      "${config.home.homeDirectory}/.local/share/qalculate" \
      "${config.home.homeDirectory}/.local/state/noctalia" \
      "${config.home.homeDirectory}/.cache/noctalia"; do
      if [ -e "$path" ]; then
        rm -rf "$path"
      fi
    done
  '';
}
