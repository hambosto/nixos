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
          border-radius: 0;
          font-family: "Ubuntu Nerd Font", "Symbols Nerd Font", sans-serif;
          font-size: 13px;
          font-weight: 600;
          min-height: 0;
          margin: 0;
          padding: 0;
          box-shadow: none;
          text-shadow: none;
          -gtk-icon-shadow: none;
      }

      window#waybar {
          background-color: transparent;
          transition: none;
      }

      /* Base module styling */
      .modules-left,
      .modules-center,
      .modules-right {
          background-color: #${config.lib.stylix.colors.base00};
          border-radius: 12px;
          margin: 4px;
          border: 1px solid alpha(#${config.lib.stylix.colors.base0D}, 0.3);
      }

      /* Individual module styling */
      #workspaces,
      #window,
      #clock,
      #network,
      #pulseaudio,
      #backlight,
      #battery,
      #power-profiles-daemon,
      #tray,
      #custom-rofi,
      #custom-swaync,
      #custom-wlogout {
          background-color: transparent;
          color: #${config.lib.stylix.colors.base05};
          padding: 6px 12px;
          margin: 0 2px;
          border-radius: 8px;
          transition: all 0.3s ease;
      }

      /* Hover effects */
      #workspaces button:hover,
      #network:hover,
      #pulseaudio:hover,
      #backlight:hover,
      #battery:hover,
      #power-profiles-daemon:hover,
      #custom-rofi:hover,
      #custom-swaync:hover,
      #custom-wlogout:hover,
      #clock:hover {
          background-color: alpha(#${config.lib.stylix.colors.base0D}, 0.2);
          color: #${config.lib.stylix.colors.base0D};
      }


      /* Workspaces */
      #workspaces {
          padding: 4px 8px;
          margin-right: 4px;
      }

      #workspaces button {
          background-color: transparent;
          color: alpha(#${config.lib.stylix.colors.base05}, 0.6);
          padding: 4px 8px;
          margin: 0 2px;
          border-radius: 15px;
          transition: all 0.3s ease;
          font-size: 16px;
      }

      #workspaces button.active {
          color: #${config.lib.stylix.colors.base0D};
          font-weight: bold;
      }

      #workspaces button.urgent {
          background-color: #${config.lib.stylix.colors.base08};
          color: #${config.lib.stylix.colors.base00};
          animation: urgent 2s ease-in-out infinite;
      }

      /* Window title */
      #window {
          color: #${config.lib.stylix.colors.base0E};
          font-weight: 500;
          margin-left: 0px;
      }

      /* Clock */
      #clock {
          color: #${config.lib.stylix.colors.base0C};
          font-weight: bold;
          font-size: 14px;
          padding: 6px 16px;
      }

      /* Network */
      #network {
          color: #${config.lib.stylix.colors.base0B};
      }

      #network.disconnected {
          color: #${config.lib.stylix.colors.base08};
          background-color: alpha(#${config.lib.stylix.colors.base08}, 0.2);
      }

      /* Audio */
      #pulseaudio {
          color: #${config.lib.stylix.colors.base0A};
      }

      #pulseaudio.muted {
          color: #${config.lib.stylix.colors.base03};
          background-color: alpha(#${config.lib.stylix.colors.base03}, 0.2);
      }

      /* Backlight */
      #backlight {
          color: #${config.lib.stylix.colors.base09};
      }

      /* Battery */
      #battery {
          color: #${config.lib.stylix.colors.base0B};
      }

      #battery.charging {
          color: #${config.lib.stylix.colors.base0D};
          background-color: alpha(#${config.lib.stylix.colors.base0D}, 0.15);
      }

      #battery.warning:not(.charging) {
          color: #${config.lib.stylix.colors.base09};
          background-color: alpha(#${config.lib.stylix.colors.base09}, 0.2);
      }

      #battery.critical:not(.charging) {
          color: #${config.lib.stylix.colors.base08};
          background-color: alpha(#${config.lib.stylix.colors.base08}, 0.2);
          animation: critical 1s ease-in-out infinite alternate;
      }

      /* Power profiles */
      #power-profiles-daemon {
          color: #${config.lib.stylix.colors.base0F};
      }

      /* System tray */
      #tray {
          color: #${config.lib.stylix.colors.base05};
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
      }

      /* Custom modules */
      #custom-rofi {
          color: #${config.lib.stylix.colors.base0A};
          font-size: 16px;
          margin-right: 4px;
      }

      #custom-swaync {
          color: #${config.lib.stylix.colors.base0C};
      }

      #custom-wlogout {
          color: #${config.lib.stylix.colors.base08};
          margin-left: 8px;
      }

      /* Tooltips */
      tooltip {
          background-color: alpha(#${config.lib.stylix.colors.base00}, 0.95);
          border: 1px solid alpha(#${config.lib.stylix.colors.base0D}, 0.5);
          border-radius: 8px;
          color: #${config.lib.stylix.colors.base05};
          font-size: 12px;
          padding: 8px 12px;
      }

      tooltip label {
          color: #${config.lib.stylix.colors.base05};
      }

      /* Animations */
      @keyframes urgent {
          0% { 
              background-color: #${config.lib.stylix.colors.base08}; 
          }
          50% { 
              background-color: alpha(#${config.lib.stylix.colors.base08}, 0.7); 
          }
          100% { 
              background-color: #${config.lib.stylix.colors.base08}; 
          }
      }

      @keyframes critical {
          0% { opacity: 1; }
          50% { opacity: 0.7; }
          100% { opacity: 1; }
      }
    '';
  };
}
