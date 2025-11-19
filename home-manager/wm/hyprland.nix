{
  config,
  lib,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {

      animations = {
        enabled = true;
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
      };

      bind = [
        # Applications
        "SUPER, E, exec, ${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.yazi}"
        "SUPER, L, exec, ${lib.getExe pkgs.hyprlock}"
        "SUPER, RETURN, exec, ${lib.getExe pkgs.kitty} --title kitty"
        "SUPER, SPACE, exec, ${lib.getExe pkgs.rofi} -show drun"
        "SUPER SHIFT, M, exec, ${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.btop}"

        # Window Management
        "SUPER, down, movefocus, d"
        "SUPER, F, fullscreen, 0"
        "SUPER, G, togglegroup"
        "SUPER, J, togglesplit"
        "SUPER, K, swapsplit"
        "SUPER, left, movefocus, l"
        "SUPER, M, fullscreen, 1"
        "SUPER, Q, killactive"
        "SUPER, right, movefocus, r"
        "SUPER, T, togglefloating"
        "SUPER, up, movefocus, u"
        "SUPER ALT, down, swapwindow, d"
        "SUPER ALT, left, swapwindow, l"
        "SUPER ALT, right, swapwindow, r"
        "SUPER ALT, up, swapwindow, u"
        "SUPER SHIFT, down, resizeactive, 0 100"
        "SUPER SHIFT, left, resizeactive, -100 0"
        "SUPER SHIFT, right, resizeactive, 100 0"
        "SUPER SHIFT, T, workspaceopt, allfloat"
        "SUPER SHIFT, up, resizeactive, 0 -100"

        # Workspaces - Switch
        "SUPER, 0, workspace, 10"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "SUPER, Tab, workspace, m+1"
        "SUPER CTRL, down, workspace, empty"
        "SUPER SHIFT, Tab, workspace, m-1"

        # Workspaces - Move Window
        "SUPER SHIFT, 0, movetoworkspace, 10"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"

        # Fn keys
        ", XF86AudioLowerVolume, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMicMute, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioMute, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1"
        ", XF86MonBrightnessDown, exec, ${lib.getExe pkgs.brightnessctl} set 5%-"
        ", XF86MonBrightnessUp, exec, ${lib.getExe pkgs.brightnessctl} set +5%"
      ];

      binde = [
        "ALT, Tab, bringactivetotop"
        "ALT, Tab, cyclenext"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      binds = {
        workspace_back_and_forth = false;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      decoration = {
        blur = {
          enabled = true;
          size = 4;
          passes = 5;
          vibrancy = 1;
          new_optimizations = true;
        };

        dim_inactive = false;
        rounding = 5;

        shadow = {
          range = 6;
          render_power = 4;
        };
      };

      dwindle = {
        preserve_split = true;
        pseudotile = true;
      };

      ecosystem = {
        no_update_news = true;
      };

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "GDK_SCALE,1"
        "GDK_BACKEND,wayland,x11,*"
        "CLUTTER_BACKEND,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "OZONE_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
      ];

      exec-once = [ "${lib.getExe pkgs.awww} img ${config.stylix.image}" ];

      general = {
        border_size = 2;
        gaps_in = 6;
        gaps_out = 8;
        layout = "dwindle";
        resize_on_border = true;
      };

      gestures = {
        gesture = "3, horizontal, workspace";
      };

      input = {
        follow_mouse = 1;
        kb_layout = "us";
        kb_model = "";
        kb_options = "";
        kb_variant = "";
        mouse_refocus = false;
        numlock_by_default = true;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
          scroll_factor = 1.0; # Touchpad scroll factor
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 1;
      };

      monitor = [ ", preferred, auto, 1" ];

      windowrulev2 = [
        "float,title:^(Picture-in-Picture)$"
        "move 69.5% 4%,title:^(Picture-in-Picture)$"
        "pin,title:^(Picture-in-Picture)$"

        "float,class:(.*org.pulseaudio.pavucontrol.*)"
        "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
        "center,class:(.*org.pulseaudio.pavucontrol.*)"
        "pin,class:(.*org.pulseaudio.pavucontrol.*)"

        "float, title:^(.*Network Manager.*)$"

        "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"
      ];

      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
