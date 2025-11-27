{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/rofi"
          "hyprland/window"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "tray"
          "memory"
          "cpu"
          "pulseaudio"
          "network"
          "battery"
          "backlight"
          "power-profiles-daemon"
          "idle_inhibitor"
          "clock"
          "custom/powermenu"
        ];

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

        cpu = {
          format = " {usage}%";
          interval = 1;
          tooltip = false;
        };

        clock = {
          format = "󰥔 {:L%H:%M %Z}";
          tooltip = false;
        };

        "custom/rofi" = {
          format = "";
          on-click = "${lib.getExe pkgs.rofi} -show drun";
          tooltip-format = "Open the application launcher";
        };

        "custom/powermenu" = {
          format = "";
          tooltip = false;
        };

        "hyprland/window" = {
          max-length = 25;
          separate-outputs = false;
          rewrite = {
            "" = " Desktop";
            ".*Visual Studio Code.*" = "󰨞 Visual Studio Code";
            ".*VSCodium.*" = " VSCodium";
            ".*Mozilla Firefox.*" = "󰈹 Mozilla Firefox";
            ".*Chromium.*" = " Chromium Browser";
            ".*Brave.*" = " Brave Browser";
            ".*Thunar.*" = " Thunar";
            ".*mpv.*" = " MPV";
            ".*imv.*" = " IMV";
            ".*Spotify.*" = " Spotify";
            ".*\.pdf" = " PDF Viewer";
            ".*Nvim.*" = " Neovim";
            ".*yazi.*" = "󰇥 Yazi";
            ".*kitty.*" = "󰄛 Kitty";
            ".*btop.*" = " Process Monitor";
            ".*htop.*" = " Process Monitor";
            ".*hx.*" = "󰅴 Helix";
            ".*Obsidian.*" = "󱓧 Obsidian";
            ".*Network Manager.*" = "󱫋 Network Manager GUI";
          };
        };

        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          persistent-workspaces = {
            "*" = 5;
          };
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰾪";
          };
          tooltip = true;
        };

        memory = {
          format = " {}%";
          interval = 1;
          tooltip = false;
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
          on-click = "${lib.getExe pkgs.nmgui}";
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
          on-click = "${lib.getExe pkgs.pavucontrol}";
          tooltip = false;
        };

        tray = {
          icon-size = 18;
          spacing = 10;
          show-passive-items = true;
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: Ubuntu Nerd Font;
        font-weight: bold;
        font-size: 13px;
        color: #${config.lib.stylix.colors.base05};
      }

      window#waybar {
        background: transparent;
      }

      window#waybar > box {
        margin: 5px 9px 0px 9px;
        padding: 2px 0;
        background-color: #${config.lib.stylix.colors.base00};
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: 5px;
      }

      tooltip {
        background-color: #${config.lib.stylix.colors.base00};
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: 5px;
      }

      #idle_inhibitor,
      #workspaces,
      #window,
      #clock,
      #cpu,
      #memory,
      #network,
      #tray,
      #pulseaudio,
      #backlight,
      #power-profiles-daemon,
      #battery,
      #custom-rofi,
      #custom-powermenu {
        padding: 0 6px;
        margin: 0 4px;
      }

      #window:hover,
      #clock:hover,
      #cpu:hover,
      #memory:hover,
      #backlight:hover,
      #battery:hover,
      #tray:hover {
        background-color: transparent;
        color: #${config.lib.stylix.colors.base05};
      }

      #idle_inhibitor:hover,
      #network:hover,
      #pulseaudio:hover,
      #power-profiles-daemon:hover,
      #custom-rofi:hover,
      #custom-powermenu:hover {
        background-color: #${config.lib.stylix.colors.base0D};
        color: #${config.lib.stylix.colors.base00};
        border-radius: 5px;
      }

      #workspaces button {
        color: #${config.lib.stylix.colors.base05};
        background: transparent;
        border-radius: 5px;
        margin: 2px 1px;
        padding: 0 6px;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.active {
        background-color: #${config.lib.stylix.colors.base0D};
        color: #${config.lib.stylix.colors.base00};
        margin: 2px 1px;
        padding: 0 6px;
        transition: all 0.4s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #workspaces button:hover {
        background-color: #${config.lib.stylix.colors.base0D};
        color: #${config.lib.stylix.colors.base00};
        transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #tray {
        padding: 0 8px;
        background-color: #${config.lib.stylix.colors.base00};
        border-radius: 5px;
      }

      #tray menu {
        background-color: #${config.lib.stylix.colors.base00};
        border-radius: 5px;
      }

      #tray menu menuitem {
        border-radius: 5px;
        transition: background-color 0.2s ease-in-out;
      }

      #tray menu menuitem:hover {
        background-color: #${config.lib.stylix.colors.base0E};
      }

      #battery.charging {
        border-radius: 5px;
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.2);
        color: #${config.lib.stylix.colors.base0D};
      }

      #network.disconnected,
      #battery.critical:not(.charging) {
        border-radius: 5px;
        background: alpha(#${config.lib.stylix.colors.base08}, 0.2);
        color: #${config.lib.stylix.colors.base08};
        animation: critical 1s ease-in-out infinite alternate;
      }

      @keyframes critical {
        0% {
          opacity: 1;
        }
        50% {
          opacity: 0.7;
        }
        100% {
          opacity: 1;
        }
      }
    '';
  };
}
