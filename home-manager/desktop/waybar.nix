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
          "custom/browser"
          "custom/terminal"
          "custom/editor"
          "custom/explorer"
          "custom/monitor"
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
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
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
          format = " {:L%H:%M}";
          tooltip = false;
        };

        "hyprland/window" = {
          max-length = 20;
          separate-outputs = false;
          rewrite = {
            "" = "Desktop";
          };
        };

        network = {
          format = "{ifname}";
          format-ethernet = " {ifname}";
          format-wifi = "  {signalStrength}%";
          format-disconnected = "Disconnected ⚠";
          tooltip = false;
          on-click = lib.getExe pkgs.iwgtk;
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          scroll-step = 1;
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
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
          format = "";
          on-click = "rofi-launcher";
          tooltip-format = "Open the application launcher";
        };

        "custom/browser" = {
          format = "";
          on-click = lib.getExe pkgs.firefox;
          tooltip-format = "Open the web browser";
        };

        "custom/terminal" = {
          format = "";
          on-click = lib.getExe pkgs.kitty;
          tooltip-format = "Open the terminal";
        };

        "custom/editor" = {
          format = "";
          on-click = lib.getExe pkgs.vscode;
          tooltip-format = "Open the code editor";
        };

        "custom/explorer" = {
          format = "";
          on-click = lib.getExe pkgs.xfce.thunar;
          tooltip-format = "Open the file explorer";
        };

        "custom/monitor" = {
          format = "";
          on-click = "${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.btop}";
          tooltip-format = "Open the system monitor";
        };

        "custom/swaync" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "";
            none = "";
            dnd-notification = "";
            dnd-none = "";
            inhibited-notification = "";
            inhibited-none = "";
            dnd-inhibited-notification = "";
            dnd-inhibited-none = "";

          };
          return-type = "json";
          exec = "${lib.getExe' pkgs.swaynotificationcenter "swaync-client"} -swb";
          on-click = "${lib.getExe' pkgs.swaynotificationcenter "swaync-client"} -t -sw";
          on-click-right = "${lib.getExe' pkgs.swaynotificationcenter "swaync-client"} -d -sw";
          escape = true;
        };

        battery = {
          states = {
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = "󰂅 {capacity}%";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
          tooltip = false;
        };
      }
    ];

    style = ''
      * {
          border: none;
          font-family: Ubuntu Nerd Font;
          font-size: 12px;
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
      #custom-browser,
      #custom-terminal,
      #custom-editor,
      #custom-explorer,
      #custom-monitor,
      #custom-swaync,
      #power-profiles-daemon,
      #window {
          background-color: #${config.lib.stylix.colors.base00};
          border: 2px solid #${config.lib.stylix.colors.base0D};
          border-radius: 10px;
          padding: 4px 12px;
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
          padding: 4px 8px;
          margin: 0 3px;
          border-radius: 30px;
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

      #battery.warning:not(.charging),
      #battery.critical:not(.charging),
      #pulseaudio.muted,
      #network.disconnected {
          background-color: #${config.lib.stylix.colors.base08};
          color: #${config.lib.stylix.colors.base00};
          border-color: #${config.lib.stylix.colors.base08};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #tray menu,
      tooltip {
          background-color: #${config.lib.stylix.colors.base00};
          border-radius: 13px;
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

      /* Icon-specific color styling */
      #battery {
          color: #${config.lib.stylix.colors.base0B}; /* Green */
      }

      #workspaces {
          color: #${config.lib.stylix.colors.base0C}; /* Cyan */
      }

      #clock {
          color: #${config.lib.stylix.colors.base0F}; /* Brown */
      }

      #network {
          color: #${config.lib.stylix.colors.base0D}; /* Blue */
      }

      #pulseaudio {
          color: #${config.lib.stylix.colors.base08}; /* Red */
      }

      #backlight {
          color: #${config.lib.stylix.colors.base0E}; /* Magenta */
      }

      #tray {
          color: #${config.lib.stylix.colors.base0F}; /* Brown */
      }

      #custom-wlogout {
          color: #${config.lib.stylix.colors.base05}; /* Default */
      }

      #custom-rofi {
          color: #${config.lib.stylix.colors.base0A}; /* Amber */
      }

      #custom-browser {
          color: #${config.lib.stylix.colors.base0B}; /* Green */
      }

      #custom-terminal {
          color: #${config.lib.stylix.colors.base0D}; /* Blue */
      }

      #custom-editor {
          color: #${config.lib.stylix.colors.base0F}; /* Brown */
      }

      #custom-explorer {
          color: #${config.lib.stylix.colors.base08}; /* Red */
      }

      #custom-swaync {
          color: #${config.lib.stylix.colors.base0E}; /* Magenta */
      }

      #power-profiles-daemon {
          color: #${config.lib.stylix.colors.base09}; /* Yellow */
      }

      #custom-monitor {
          color: #${config.lib.stylix.colors.base0C}; /* Cyan */
      }

      /* Add blinking effect to urgent icons */
      @keyframes blink {
          from { opacity: 0.8; }
          to { opacity: 1.0; }
      }
    '';
  };
}
