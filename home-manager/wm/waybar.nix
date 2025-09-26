{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.waybar = {
    enable = config.wayland.windowManager.hyprland.enable;
    systemd.enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        modules-left = [ "group/modules-left" ];
        modules-right = [ "group/modules-right" ];

        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          persistent-workspaces = {
            "*" = 5;
          };
        };

        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "󰈐";
            power-saver = "";
          };
        };

        clock = {
          format = "󰥔 {:L%H:%M %Z}";
          tooltip = false;
        };

        "hyprland/window" = {
          max-length = 20;
          separate-outputs = false;
          rewrite = {
            "" = " Desktop";
            ".*Visual Studio Code.*" = "󰨞 Visual Studio Code";
            ".*Mozilla Firefox.*" = "󰈹 Mozilla Firefox";
            ".*Chromium.*" = " Chromium";
            ".*Brave.*" = "󰖟 Brave";
            ".*Thunar.*" = " Thunar";
            ".*mpv.*" = " MPV";
            ".*imv.*" = " IMV";
            ".*Spotify.*" = " Spotify";
            ".*\.pdf" = " PDF Viewer";
            ".*Nvim.*" = " Neovim";
            ".*yazi.*" = " Yazi";
            ".*Terminal.*" = " Terminal";
            ".*btop.*" = " Resource Monitor";
            ".*hx.*" = "󰅴 Helix";
          };
        };

        network = {
          format = "{ifname}";
          format-ethernet = " {ifname}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰅛 Disconnected";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          tooltip = false;
          on-click = "${lib.getExe pkgs.iwmenu} --launcher rofi";
        };

        tray = {
          icon-size = 18;
          spacing = 10;
          show-passive-items = true;
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          scroll-step = 1;
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󱡏";
            headset = "󰋎";
            phone = "󰏲";
            portable = "󰦧";
            car = "󰄋";
            default = "󰕾";
          };
          on-click = "${lib.getExe pkgs.pwmenu} --launcher rofi";
          tooltip = false;
        };

        "custom/wlogout" = {
          format = "";
          on-click = lib.getExe pkgs.wlogout;
          tooltip = false;
        };

        "custom/rofi" = {
          format = "";
          on-click = "${lib.getExe pkgs.rofi} -show drun";
          tooltip-format = "Open the application launcher";
        };

        "custom/swaync" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "󰂚";
            none = "󰂜";
            dnd-notification = "󰂛";
            dnd-none = "󰪑";
            inhibited-notification = "󰂚";
            inhibited-none = "󰂜";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";

          };
          return-type = "json";
          exec = "${lib.getExe' pkgs.swaynotificationcenter "swaync-client"} -swb";
          on-click = "${lib.getExe' pkgs.swaynotificationcenter "swaync-client"} -t -sw";
          on-click-right = "${lib.getExe' pkgs.swaynotificationcenter "swaync-client"} -d -sw";
          escape = true;
        };

        battery = {
          states = {
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂅 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip = false;
        };

        "group/modules-control" = {
          orientation = "horizontal";
          modules = [
            "pulseaudio"
            "network"
            "battery"
            "backlight"
          ];
        };

        "group/modules-left" = {
          orientation = "horizontal";
          modules = [
            "custom/rofi"
            "hyprland/window"
          ];
        };

        "group/modules-right" = {
          orientation = "horizontal";
          modules = [
            "tray"
            "group/modules-control"
            "power-profiles-daemon"
            "clock"
            "custom/swaync"
            "custom/wlogout"
          ];
        };
      }
    ];

    style = ''
      * {
        all: unset;
        font-family: Ubuntu Nerd Font;
        font-weight: 700;
        font-size: 13px;
        color: #${config.lib.stylix.colors.base05};
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      window#waybar {
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
      }

      tooltip {
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base0D};
        border-radius: 5px;
        color: #${config.lib.stylix.colors.base05};
      }

      #workspaces {
        margin: 2px 4px;
        padding: 1px 20px;
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: 5px;
        background: #${config.lib.stylix.colors.base00};
      }

      #workspaces button {
        min-width: 20px;
        margin: 2px 3px;
        padding: 2px 3px;
        border: none;
        border-radius: 5px;
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.2);
        color: alpha(#${config.lib.stylix.colors.base0D}, 0.4);
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      #workspaces button:hover {
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.4);
        color: alpha(#${config.lib.stylix.colors.base0D}, 0.8);
      }

      #workspaces button.active {
        min-width: 28px;
        background: #${config.lib.stylix.colors.base0D};
        color: #${config.lib.stylix.colors.base00};
        transition: all 0.2s ease;
      }

      #workspaces button.urgent {
        background: #${config.lib.stylix.colors.base08};
        color: #${config.lib.stylix.colors.base00};
      }

      #modules-left,
      #modules-right {
        margin: 2px 4px;
        padding: 1px 10px;
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: 5px;
        background: #${config.lib.stylix.colors.base00};
      }

      #tray {
        color: #${config.lib.stylix.colors.base05};
      }

      #tray>.passive { -gtk-icon-effect: dim; }
      #tray>.needs-attention { -gtk-icon-effect: highlight; }

      #modules-control {
        margin: 0 10px;
        border-radius: 15px;
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.2);
      }

      #tray,
      #pulseaudio,
      #network,
      #battery,
      #backlight,
      #custom-rofi,
      #power-profiles-daemon,
      #clock,
      #custom-swaync,
      #custom-wlogout {
        padding: 3px 6px;
        color: #${config.lib.stylix.colors.base05};
      }

      #pulseaudio:hover,
      #network:hover,
      #battery:hover,
      #backlight:hover,
      #custom-rofi:hover,
      #power-profiles-daemon:hover,
      #clock:hover,
      #custom-swaync:hover,
      #custom-wlogout:hover {
        border-radius: 15px;
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.4);
      }

      #custom-rofi,
      #power-profiles-daemon,
      #clock,
      #custom-swaync,
      #custom-wlogout {
        margin: 2px 3px;
        padding: 0 10px;
        border-radius: 10px;
        background: #${config.lib.stylix.colors.base00};
      }

      #window {
        margin: 0 20px;
        border-radius: 10px;
        color: #${config.lib.stylix.colors.base05};
      }

      #battery.charging {
        border-radius: 15px;
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.2);
        color: #${config.lib.stylix.colors.base0D};
      }

      #network.disconnected,
      #battery.critical:not(.charging) {
        border-radius: 15px;
        background: alpha(#${config.lib.stylix.colors.base08}, 0.2);
        color: #${config.lib.stylix.colors.base08};
        animation: critical 1s ease-in-out infinite alternate;
      }

      @keyframes critical {
        0% { opacity: 1; }
        50% { opacity: 0.7; }
        100% { opacity: 1; }
      }

      menu,
      menuitem {
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base0D};
        border-radius: 8px;
        color: #${config.lib.stylix.colors.base05};
        padding: 4px 10px;
      }

      menuitem:hover {
        background: #${config.lib.stylix.colors.base02};
        color: #${config.lib.stylix.colors.base05};
      }
    '';
  };
}
