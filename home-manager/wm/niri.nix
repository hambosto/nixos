{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.niri.config = with inputs.niri.lib.kdl; [
    (plain "binds" [
      (plain "Mod+Return" [
        (leaf "spawn" [
          (lib.getExe pkgs.kitty)
          "--title"
          "kitty"
        ])
      ])

      (plain "Mod+E" [
        (leaf "spawn" [
          (lib.getExe pkgs.kitty)
          "-e"
          (lib.getExe pkgs.yazi)
        ])
      ])

      (plain "Mod+Space" [
        (leaf "spawn" [
          (lib.getExe pkgs.rofi)
          "-show"
          "drun"
        ])
      ])

      (plain "Mod+L" [ (leaf "spawn" [ (lib.getExe pkgs.hyprlock) ]) ])

      (plain "Mod+Shift+M" [
        (leaf "spawn" [
          (lib.getExe pkgs.kitty)
          "-e"
          (lib.getExe pkgs.btop)
        ])
      ])

      (plain "Mod+Shift+P" [
        (leaf "spawn" [
          (lib.getExe pkgs.wlogout)
        ])
      ])

      (plain "Print" [ (leaf "screenshot-screen" { write-to-disk = true; }) ])
      (plain "Mod+Print" [ (flag "screenshot-window") ])
      (plain "Mod+Shift+Print" [ (leaf "screenshot" { show-pointer = false; }) ])

      (plain "Mod+Q" [ (flag "close-window") ])
      (plain "Mod+F" [ (flag "fullscreen-window") ])
      (plain "Mod+M" [ (flag "maximize-column") ])
      (plain "Mod+T" [ (flag "toggle-window-floating") ])
      (plain "Mod+W" [ (flag "toggle-overview") ])

      (plain "Mod+Left" [ (flag "focus-column-left") ])
      (plain "Mod+Right" [ (flag "focus-column-right") ])
      (plain "Mod+Up" [ (flag "focus-window-up") ])
      (plain "Mod+Down" [ (flag "focus-window-down") ])

      (plain "Mod+Shift+Left" [ (flag "move-column-left") ])
      (plain "Mod+Shift+Right" [ (flag "move-column-right") ])
      (plain "Mod+Shift+Up" [ (flag "move-window-up") ])
      (plain "Mod+Shift+Down" [ (flag "move-window-down") ])

      (plain "Mod+Ctrl+Left" [ (leaf "set-column-width" "-10%") ])
      (plain "Mod+Ctrl+Right" [ (leaf "set-column-width" "+10%") ])
      (plain "Mod+Ctrl+Up" [ (leaf "set-window-height" "-10%") ])
      (plain "Mod+Ctrl+Down" [ (leaf "set-window-height" "+10%") ])

      (plain "Mod+Alt+Down" [ (flag "move-column-to-workspace-down") ])
      (plain "Mod+Alt+Up" [ (flag "move-column-to-workspace-up") ])

      (plain "Mod+1" [ (leaf "focus-workspace" 1) ])
      (plain "Mod+2" [ (leaf "focus-workspace" 2) ])
      (plain "Mod+3" [ (leaf "focus-workspace" 3) ])
      (plain "Mod+4" [ (leaf "focus-workspace" 4) ])
      (plain "Mod+5" [ (leaf "focus-workspace" 5) ])
      (plain "Mod+6" [ (leaf "focus-workspace" 6) ])
      (plain "Mod+7" [ (leaf "focus-workspace" 7) ])
      (plain "Mod+8" [ (leaf "focus-workspace" 8) ])
      (plain "Mod+9" [ (leaf "focus-workspace" 9) ])
      (plain "Mod+0" [ (leaf "focus-workspace" 10) ])

      (plain "Mod+WheelScrollDown" [ (flag "focus-workspace-down") ])
      (plain "Mod+WheelScrollUp" [ (flag "focus-workspace-up") ])

      (plain "Mod+Shift+1" [ (leaf "move-window-to-workspace" 1) ])
      (plain "Mod+Shift+2" [ (leaf "move-window-to-workspace" 2) ])
      (plain "Mod+Shift+3" [ (leaf "move-window-to-workspace" 3) ])
      (plain "Mod+Shift+4" [ (leaf "move-window-to-workspace" 4) ])
      (plain "Mod+Shift+5" [ (leaf "move-window-to-workspace" 5) ])
      (plain "Mod+Shift+6" [ (leaf "move-window-to-workspace" 6) ])
      (plain "Mod+Shift+7" [ (leaf "move-window-to-workspace" 7) ])
      (plain "Mod+Shift+8" [ (leaf "move-window-to-workspace" 8) ])
      (plain "Mod+Shift+9" [ (leaf "move-window-to-workspace" 9) ])
      (plain "Mod+Shift+0" [ (leaf "move-window-to-workspace" 10) ])

      (plain "XF86AudioRaiseVolume" [
        (leaf "spawn" [
          (lib.getExe' pkgs.wireplumber "wpctl")
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%+"
          "-l"
          "1"
        ])
      ])
      (plain "XF86AudioLowerVolume" [
        (leaf "spawn" [
          (lib.getExe' pkgs.wireplumber "wpctl")
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%-"
        ])
      ])
      (plain "XF86AudioMute" [
        (leaf "spawn" [
          (lib.getExe' pkgs.wireplumber "wpctl")
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ])
      ])
      (plain "XF86AudioMicMute" [
        (leaf "spawn" [
          (lib.getExe' pkgs.wireplumber "wpctl")
          "set-mute"
          "@DEFAULT_AUDIO_SOURCE@"
          "toggle"
        ])
      ])

      (plain "XF86MonBrightnessUp" [
        (leaf "spawn" [
          (lib.getExe pkgs.brightnessctl)
          "set"
          "+5%"
        ])
      ])
      (plain "XF86MonBrightnessDown" [
        (leaf "spawn" [
          (lib.getExe pkgs.brightnessctl)
          "set"
          "5%-"
        ])
      ])
    ])

    (plain "input" [
      (plain "keyboard" [
        (plain "xkb" [
          (leaf "layout" "us")
          (leaf "model" "")
          (leaf "rules" "")
          (leaf "variant" "")
        ])
        (leaf "repeat-delay" 600)
        (leaf "repeat-rate" 25)
        (leaf "track-layout" "global")
      ])
      (plain "touchpad" [
        (flag "tap")
        (flag "natural-scroll")
        (leaf "scroll-factor" 1.0)
      ])
      (flag "warp-mouse-to-focus")
      (flag "focus-follows-mouse")
      (flag "workspace-auto-back-and-forth")
    ])

    (node "output" "eDP-1" [
      (leaf "scale" 1.0)
      (leaf "transform" "normal")
      (leaf "position" {
        x = 0;
        y = 0;
      })
    ])

    (leaf "screenshot-path" "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png")
    (flag "prefer-no-csd")

    (plain "overview" [
      (plain "workspace-shadow" [
        (flag "off")
      ])
    ])

    (plain "layout" [
      (leaf "gaps" 6)
      (plain "struts" [
        (leaf "left" 0)
        (leaf "right" 0)
        (leaf "top" 0)
        (leaf "bottom" 0)
      ])
      (plain "focus-ring" [
        (flag "off")
      ])
      (plain "border" [
        (leaf "width" 2)
        (leaf "active-color" "#${config.lib.stylix.colors.base0D}")
        (leaf "inactive-color" "#${config.lib.stylix.colors.base03}")
      ])
      (leaf "background-color" "transparent")
      (plain "default-column-width" [
        (leaf "proportion" 0.5)
      ])
      (plain "preset-column-widths" [
        (leaf "proportion" 0.25)
        (leaf "proportion" 0.5)
        (leaf "proportion" 0.75)
        (leaf "proportion" 1.0)
      ])
      (leaf "center-focused-column" "never")
      (flag "always-center-single-column")
    ])

    (plain "cursor" [
      (leaf "xcursor-theme" config.stylix.cursor.name)
      (leaf "xcursor-size" config.stylix.cursor.size)
    ])

    (plain "hotkey-overlay" [
      (flag "skip-at-startup")
    ])

    (plain "blur" [
      (leaf "passes" 3)
      (leaf "offset" 3.0)
      (leaf "noise" 0.02)
      (leaf "saturation" 1.5)
    ])

    (plain "environment" [
      (leaf "CLUTTER_BACKEND" "wayland")
      (leaf "ELECTRON_OZONE_PLATFORM_HINT" "wayland")
      (leaf "GDK_BACKEND" "wayland,x11")
      (leaf "GDK_SCALE" "1")
      (leaf "MOZ_ENABLE_WAYLAND" "1")
      (leaf "OZONE_PLATFORM" "wayland")
      (leaf "QT_AUTO_SCREEN_SCALE_FACTOR" "1")
      (leaf "QT_QPA_PLATFORM" "wayland")
      (leaf "QT_QPA_PLATFORMTHEME" "qt6ct")
      (leaf "QT_WAYLAND_DISABLE_WINDOWDECORATION" "1")
      (leaf "XDG_CURRENT_DESKTOP" "niri")
      (leaf "XDG_SESSION_DESKTOP" "niri")
      (leaf "XDG_SESSION_TYPE" "wayland")
    ])

    (plain "window-rule" [
      (leaf "clip-to-geometry" true)
      (leaf "draw-border-with-background" false)
      (leaf "geometry-corner-radius" [
        5.0
        5.0
        5.0
        5.0
      ])
    ])

    (plain "window-rule" [
      (leaf "match" { title = "^Open File.*$"; })
      (leaf "match" { title = "^Select a File.*$"; })
      (leaf "match" { title = "^Open Folder.*$"; })
      (leaf "match" { title = "^Save As.*$"; })
      (leaf "match" { title = "^File Upload.*$"; })
      (plain "default-column-width" [ (leaf "fixed" 800) ])
      (plain "default-window-height" [ (leaf "fixed" 600) ])
      (leaf "open-floating" true)
    ])

    (plain "window-rule" [
      (leaf "match" { title = "^Network Manager.*$"; })
      (leaf "match" { title = "^Volume Control.*$"; })
      (plain "default-column-width" [ (leaf "fixed" 700) ])
      (plain "default-window-height" [ (leaf "fixed" 600) ])
      (leaf "open-floating" true)
    ])

    (plain "layer-rule" [
      (leaf "match" { namespace = "^wallpaper-rs$"; })
      (leaf "place-within-backdrop" true)
    ])

    (plain "xwayland-satellite" [
      (leaf "path" (lib.getExe pkgs.xwayland-satellite-unstable))
    ])
  ];
}
