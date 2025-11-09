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
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "workspaces, 1, 7, menu_decel, slide"
        ];

        bezier = [
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "linear, 0, 0, 1, 1"
          "md2, 0.4, 0, 0.2, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "menu_decel, 0.1, 1, 0, 1"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
        ];
      };

      bind = [
        # Applications
        "SUPER, B, exec, ${lib.getExe pkgs.firefox}"
        "SUPER, E, exec, ${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.yazi}"
        "SUPER, L, exec, ${lib.getExe pkgs.hyprlock}"
        "SUPER, RETURN, exec, ${lib.getExe pkgs.kitty} --title Terminal"
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
          ignore_opacity = true;
          new_optimizations = true;
          passes = 3;
          size = 9;
          xray = false;
        };

        dim_inactive = false;
        rounding = 5;

        shadow = {
          enabled = true;
          range = 10;
          render_power = 3;
          sharp = false;
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

        "float,class:(launch-floating)"
        "size 1000 700,class:(launch-floating)"
        "center,class:(launch-floating)"

        "float,class:(.*org.pulseaudio.pavucontrol.*)"
        "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
        "center,class:(.*org.pulseaudio.pavucontrol.*)"
        "pin,class:(.*org.pulseaudio.pavucontrol.*)"
      ];

      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
