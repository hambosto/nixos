{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        modules-left = [
          "custom/rofi"
          "hyprland/window"
        ];
        modules-right = [
          "tray"
          "power-profiles-daemon"
          "network"
          "pulseaudio"
          "backlight"
          "battery"
          "clock"
          "custom/swaync"
          "custom/wlogout"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "󰮯";
            default = "󰊠";
          };
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
          };
        };

        network = {
          format = "{ifname}";
          format-ethernet = " {ifname}";
          format-wifi = "  {signalStrength}%";
          format-disconnected = "󰅛 Disconnected";
          tooltip = false;
          on-click = lib.getExe pkgs.iwgtk;
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
          on-click = lib.getExe pkgs.pavucontrol;
          tooltip = false;
        };

        "custom/wlogout" = {
          format = "";
          on-click = lib.getExe pkgs.wlogout;
          tooltip = false;
        };

        "custom/rofi" = {
          format = "";
          on-click = "${lib.getExe pkgs.rofi-wayland} -show drun";
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
      }
    ];

    style = ''
      * {
          border: none;
          font-family: Ubuntu Nerd Font;
          font-size: 13px;
          font-weight: bold;
          min-height: 0;
          margin: 0;
          padding: 0;
      }

      window#waybar {
          background: transparent;
          margin: 10px 10px 0 10px;
      }

      #workspaces,
      #clock,
      #battery,
      #backlight,
      #network,
      #pulseaudio,
      #tray,
      #custom-wlogout,
      #custom-rofi,
      #custom-swaync,
      #power-profiles-daemon,
      #window {
          background-color: #${config.lib.stylix.colors.base00};
          border: 2px solid #${config.lib.stylix.colors.base0D};
          border-radius: 10px;
          padding: 4px 10px;
          margin: 0 4px;
          color: #${config.lib.stylix.colors.base05};
      }

      #window {
          padding-left: 10px;
          color: #${config.lib.stylix.colors.base0E};
      }

      #workspaces {
          padding: 2px 6px;
          background-color: #${config.lib.stylix.colors.base00};
      }

      #workspaces button {
          background-color: transparent;
          color: #${config.lib.stylix.colors.base0D};
          padding: 4px 6px;
          margin: 0 3px;
          border-radius: 10px;
          transition: background 0.3s ease, box-shadow 0.3s ease;
      }

      #workspaces button:hover {
          background-color: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base06};
      }

      #workspaces button.active {
          background-color: #${config.lib.stylix.colors.base0B};
          color: #${config.lib.stylix.colors.base00};
          font-weight: bold;
      }

      #workspaces button.urgent {
          background-color: #${config.lib.stylix.colors.base08};
          color: #${config.lib.stylix.colors.base00};
          animation: blink 1s infinite alternate;
      }

      #network.disconnected,
      #pulseaudio.muted,
      #battery.critical:not(.charging) {
          background-color: #${config.lib.stylix.colors.base0D};
          color: #${config.lib.stylix.colors.base00};
          border-color: #${config.lib.stylix.colors.base0D};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #tray menu,
      tooltip {
          background-color: #${config.lib.stylix.colors.base00};
          border-radius: 10px;
          border: 2px solid #${config.lib.stylix.colors.base0D};
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.4);
      }

      tooltip label {
          color: #${config.lib.stylix.colors.base05};
          padding: 8px;
      }

      #battery.charging,
      #battery.plugged {
          background-color: #${config.lib.stylix.colors.base00};
          color: #${config.lib.stylix.colors.base0B};
          border-color: #${config.lib.stylix.colors.base0B};
      }

      #battery {
        color: #${config.lib.stylix.colors.base0D}; /* Blue */
      }

      #workspaces {
        color: #${config.lib.stylix.colors.base08}; /* Red */
      }

      #clock {
        color: #${config.lib.stylix.colors.base0C}; /* Cyan */
      }

      #network {
        color: #${config.lib.stylix.colors.base0E}; /* Magenta */
      }

      #pulseaudio {
        color: #${config.lib.stylix.colors.base0B}; /* Green */
      }

      #backlight {
        color: #${config.lib.stylix.colors.base0F}; /* Brown */
      }

      #tray {
        color: #${config.lib.stylix.colors.base0C}; /* Cyan */
      }

      #custom-wlogout {
        color: #${config.lib.stylix.colors.base09}; /* Yellow */
      }

      #custom-rofi {
        color: #${config.lib.stylix.colors.base0A}; /* Amber */
      }

      #custom-swaync {
        color: #${config.lib.stylix.colors.base08}; /* Red */
      }

      #power-profiles-daemon {
        color: #${config.lib.stylix.colors.base0F}; /* Brown */
      }

      @keyframes blink {
          from { opacity: 0.8; }
          to { opacity: 1.0; }
      }
    '';

    # uncomment this to use the gnome like waybar theme
    # style = ''
    #   * {
    #       border: none;
    #       border-radius: 0;
    #       font-family: Ubuntu Nerd Font;
    #       font-size: 13px;
    #       font-weight: 400;
    #       min-height: 0;
    #       margin: 0;
    #       padding: 0;
    #       transition: all 0.2s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    #   }

    #   window#waybar {
    #       background-color: #${config.lib.stylix.colors.base00};
    #       border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    #       margin: 0;
    #       padding: 0;
    #       border-radius: 15px;
    #   }

    #   #workspaces,
    #   #clock,
    #   #battery,
    #   #backlight,
    #   #network,
    #   #pulseaudio,
    #   #tray,
    #   #custom-wlogout,
    #   #custom-rofi,
    #   #custom-swaync,
    #   #power-profiles-daemon,
    #   #window {
    #       background-color: transparent;
    #       color: #${config.lib.stylix.colors.base05};
    #       padding: 0 8px;
    #       margin: 0;
    #       min-height: 32px;
    #       border-radius: 0;
    #   }

    #   #custom-rofi {
    #       color: #${config.lib.stylix.colors.base0D};
    #       font-size: 18px;
    #       padding: 0 12px;
    #       margin-right: 6px;
    #   }

    #   #custom-rofi:hover {
    #       background-color: #${config.lib.stylix.colors.base01};
    #       color: #${config.lib.stylix.colors.base0D};
    #   }

    #   #window {
    #       font-size: 16px;
    #       color: #${config.lib.stylix.colors.base05};
    #       padding-left: 0;
    #       margin-left: 0;
    #   }

    #   #workspaces {
    #       margin: 4px 0;
    #       padding: 0 8px;
    #   }

    #   #workspaces button {
    #       background-color: transparent;
    #       color: #${config.lib.stylix.colors.base04};
    #       padding: 4px 8px;
    #       margin: 0 1px;
    #       border-radius: 10px;
    #       min-width: 20px;
    #       font-size: 16px;
    #   }

    #   #workspaces button:hover {
    #       background-color: #${config.lib.stylix.colors.base02};
    #       color: #${config.lib.stylix.colors.base05};
    #   }

    #   #workspaces button.active {
    #       background-color: #${config.lib.stylix.colors.base0D};
    #       color: #${config.lib.stylix.colors.base00};
    #       font-weight: 600;
    #       box-shadow: 0 1px 3px #${config.lib.stylix.colors.base03};
    #   }

    #   #workspaces button.urgent {
    #       background-color: #${config.lib.stylix.colors.base08};
    #       color: #${config.lib.stylix.colors.base00};
    #       animation: urgent-pulse 1s ease-in-out infinite alternate;
    #   }

    #   #clock {
    #       font-weight: 500;
    #       color: #${config.lib.stylix.colors.base05};
    #       padding: 0 12px;
    #       font-size: 13px;
    #   }

    #   #clock:hover {
    #       background-color: #${config.lib.stylix.colors.base01};
    #   }

    #   /* Right panel items */
    #   #tray,
    #   #power-profiles-daemon,
    #   #network,
    #   #pulseaudio,
    #   #backlight,
    #   #battery,
    #   #custom-swaync,
    #   #custom-wlogout {
    #       padding: 0 8px;
    #       color: #${config.lib.stylix.colors.base04};
    #       font-size: 16px;
    #   }

    #   #tray:hover,
    #   #power-profiles-daemon:hover,
    #   #network:hover,
    #   #pulseaudio:hover,
    #   #backlight:hover,
    #   #battery:hover,
    #   #custom-swaync:hover,
    #   #custom-wlogout:hover {
    #       background-color: #${config.lib.stylix.colors.base01};
    #       color: #${config.lib.stylix.colors.base05};
    #   }

    #   #network.disconnected {
    #       color: #${config.lib.stylix.colors.base08};
    #   }

    #   #pulseaudio.muted {
    #       color: #${config.lib.stylix.colors.base08};
    #   }

    #   #battery.warning:not(.charging) {
    #       color: #${config.lib.stylix.colors.base0A};
    #   }

    #   #battery.critical:not(.charging) {
    #       color: #${config.lib.stylix.colors.base08};
    #       animation: critical-battery 1s ease-in-out infinite alternate;
    #   }

    #   #battery.charging,
    #   #battery.plugged {
    #       color: #${config.lib.stylix.colors.base0B};
    #   }

    #   #tray > .passive {
    #       -gtk-icon-effect: dim;
    #   }

    #   #tray > .needs-attention {
    #       -gtk-icon-effect: highlight;
    #       background-color: #${config.lib.stylix.colors.base08};
    #   }

    #   #custom-wlogout {
    #       color: #${config.lib.stylix.colors.base08};
    #       font-size: 16px;
    #       margin-right: 6px;
    #   }

    #   #custom-swaync {
    #       color: #${config.lib.stylix.colors.base0D};
    #   }

    #   tooltip {
    #       background-color: #${config.lib.stylix.colors.base00};
    #       border: 1px solid #${config.lib.stylix.colors.base03};
    #       border-radius: 8px;
    #       box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    #   }

    #   tooltip label {
    #       color: #${config.lib.stylix.colors.base05};
    #       padding: 8px 12px;
    #       font-size: 10px;
    #   }

    #   @keyframes urgent-pulse {
    #       from {
    #           background-color: #${config.lib.stylix.colors.base08};
    #       }
    #       to {
    #           background-color: #${config.lib.stylix.colors.base09};
    #       }
    #   }

    #   @keyframes critical-battery {
    #       from { opacity: 0.6; }
    #       to { opacity: 1.0; }
    #   }
    # '';
  };
}
