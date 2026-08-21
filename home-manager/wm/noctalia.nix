{ config, lib, ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    customPalettes.stylix.dark = with config.lib.stylix.colors.withHashtag; {
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
    settings = {
      bar.default = {
        background_opacity = config.stylix.opacity.desktop;
        capsule = false;
        capsule_group = [ ];
        capsule_opacity = config.stylix.opacity.desktop;
        capsule_radius = 10;
        center = [ "clock" ];
        end = [
          "tray"
          "network"
          "volume"
          "brightness"
          "battery"
          "control-center"
          "notifications"
          "session"
        ];
        font_weight = 700;
        margin_edge = 5;
        margin_ends = 325;
        margin_opposite_edge = 5;
        radius = 10;
        start = [
          "launcher"
          "workspaces"
          "active_window"
        ];
        thickness = 35;
        widget_spacing = 10;
      };
      battery.warning_threshold = 30;
      desktop_widgets.enabled = false;
      dock.background_opacity = config.stylix.opacity.desktop;
      idle.behavior = {
        behavior_order = [
          "screen-off"
          "lock-and-suspend"
          "lock"
        ];
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
      location.address = "Malang, Indonesia";
      lockscreen = {
        fingerprint = false;
        wallpaper = config.stylix.image;
      };
      lockscreen_widgets = {
        enabled = true;
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        schema_version = 2;
        widget = {
          "lockscreen-login-box@eDP-1" = {
            box_height = 196;
            box_width = 810;
            cx = 960;
            cy = 1077;
            output = "eDP-1";
            rotation = 0;
            settings = {
              background_opacity = config.stylix.opacity.desktop;
              background_radius = 12;
              center_password_text = false;
              input_opacity = 1;
              input_radius = 6;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
            type = "login_box";
          };
          lockscreen-widget-0000000000000001 = {
            box_height = 192;
            box_width = 400;
            cx = 960;
            cy = 232;
            output = "eDP-1";
            rotation = 0;
            settings = {
              background = false;
              clock_style = "digital";
            };
            type = "clock";
          };
        };
        widget_order = [
          "lockscreen-login-box@eDP-1"
          "lockscreen-widget-0000000000000001"
        ];
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
        clipboard_keep_from_closed_apps = false;
        font_family = config.stylix.fonts.monospace.name;
        lang = "en";
        launch_apps_as_systemd_services = true;
        launcher = {
          auto_paste = "off";
          fetch_exchange_rates = false;
          providers.calculator.global = false;
          show_app_origin_indicator = false;
          sort_by_usage = false;
        };
        panel = {
          control_center_placement = "attached";
          control_center_position = "center";
          launcher_placement = "attached";
          session_placement = "attached";
          transparency_mode = "glass";
        };
        polkit_agent = false;
        screenshot = {
          copy_to_clipboard = false;
          freeze_screen = false;
          save_to_file = false;
        };
        settings_show_advanced = true;
        settings_window_translucent = true;
        shadow.alpha = 0.7;
      };
      theme = {
        custom_palette = "stylix";
        mode = "dark";
        source = "custom";
      };
      wallpaper.enabled = false;
      widget = {
        battery = {
          display_mode = "graphic";
          scale = 0.95;
        };
        clock.format = "{:%H:%M %p}";
        control-center.glyph = "menu-2";
        launcher.glyph = "snowflake";
        network.show_label = true;
        workspaces = {
          hide_when_empty = true;
          show_labels = false;
        };
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
