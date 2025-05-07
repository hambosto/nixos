{
  lib,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    package = pkgs.hyprland;

    settings = {

      monitor = [ ", preferred, auto, 1" ];

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

        "APPIMAGELAUNCHER_DISABLE,1"

        "OZONE_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
      ];

      general = {
        gaps_in = 1;
        gaps_out = 1;
        border_size = 3;
        resize_on_border = true;
        layout = "dwindle";
      };

      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      decoration = {
        active_opacity = 1;
        inactive_opacity = 1;
        rounding = 15;

        shadow = {
          enabled = true;
          range = 10;
          render_power = 3;
          offset = "12 12";
          scale = 0.97;
        };

        blur = {
          enabled = true;
          size = 16;
          xray = true;
          new_optimizations = "on";
          brightness = 0.8;
          contrast = 0.9;
          noise = 0.01;
          passes = 4;
          ignore_opacity = true;
        };
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        numlock_by_default = true;
        mouse_refocus = false;
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
          middle_button_emulation = true;
          clickfinger_behavior = false;
          disable_while_typing = true;
          scroll_factor = 1.0;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 1;
      };

      windowrulev2 = [
        "float,title:^(Picture-in-Picture)$"
        "pin,title:^(Picture-in-Picture)$"
        "move 69.5% 4%,title:^(Picture-in-Picture)$"

        # "float, class:(org.nickvision.cavalier)"
        # "pin, class:(org.nickvision.cavalier)"
        # "size 400 726,class:(org.nickvision.cavalier)"
        # "move 100%-w-16 66,class:(org.nickvision.cavalier)"

        # "float,class:Wallpaper Manager"
        # "float,class:About Wallpaper Manager"

        # "float,class:(.*org.pulseaudio.pavucontrol.*)"
        # "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
        # "center,class:(.*org.pulseaudio.pavucontrol.*)"
        # "pin,class:(.*org.pulseaudio.pavucontrol.*)"

        "float,class:(org.twosheds.iwgtk)"
        "size 700 600,class:(org.twosheds.iwgtk)"
        "center,class:(org.twosheds.iwgtk)"
        "pin,class:(org.twosheds.iwgtk)"

        "float,title:^(Wireless network credentials)$"
        "size 700 600,title:^(Wireless network credentials)$"
        "center,title:^(Wireless network credentials)$"
        "pin,title:^(Wireless network credentials)$"

      ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      bind = [
        # Applications
        "SUPER, RETURN, exec, ${lib.getExe pkgs.kitty}"
        "SUPER, E, exec, ${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.yazi}"
        "SUPER, L, exec, ${lib.getExe pkgs.hyprlock}"
        "SUPER, B, exec, ${lib.getExe pkgs.firefox}"
        "SUPER, SPACE, exec, rofi-launcher"
        "SUPER, PRINT, exec, screenshot everything"
        "SUPER SHIFT, PRINT, exec, screenshot selection"

        "SUPER, Q, killactive"
        "SUPER SHIFT, Q, exec, hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"
        "SUPER, F, fullscreen, 0"
        "SUPER, M, fullscreen, 1"
        "SUPER, T, togglefloating"
        "SUPER SHIFT, T, workspaceopt, allfloat"
        "SUPER, J, togglesplit"
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER SHIFT, right, resizeactive, 100 0"
        "SUPER SHIFT, left, resizeactive, -100 0"
        "SUPER SHIFT, down, resizeactive, 0 100"
        "SUPER SHIFT, up, resizeactive, 0 -100"
        "SUPER, G, togglegroup"
        "SUPER, K, swapsplit"
        "SUPER ALT, left, swapwindow, l"
        "SUPER ALT, right, swapwindow, r"
        "SUPER ALT, up, swapwindow, u"
        "SUPER ALT, down, swapwindow, d"

        # Workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        "SUPER ALT, left, swapwindow, l"
        "SUPER ALT, right, swapwindow, r"
        "SUPER ALT, up, swapwindow, u"
        "SUPER ALT, down, swapwindow, d"

        "SUPER, Tab, workspace, m+1"
        "SUPER SHIFT, Tab, workspace, m-1"

        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "SUPER CTRL, down, workspace, empty"

        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "SUPER CTRL, down, workspace, empty"

        # Fn keys
        ", XF86AudioRaiseVolume, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessUp, exec, ${lib.getExe pkgs.brightnessctl} set +5%"
        ", XF86MonBrightnessDown, exec, ${lib.getExe pkgs.brightnessctl} set 5%-"
        ", XF86AudioMute, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      binde = [
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop"
      ];
    };
  };
}
