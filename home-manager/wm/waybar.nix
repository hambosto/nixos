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
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [ "clock" ];
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
          "custom/wlogout"
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
          format-charging = "{icon} {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
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
          };
          tooltip = false;
        };

        cpu = {
          format = " {usage}%";
          interval = 1;
          tooltip = false;
        };

        clock = {
          format = " {:L%H:%M %Z • %a %d}";
          tooltip = false;
        };

        "custom/rofi" = {
          format = "󰀻";
          on-click = "${lib.getExe pkgs.rofi} -show drun";
          tooltip-format = "Open the application launcher";
        };

        "custom/wlogout" = {
          format = "";
          on-click = "${lib.getExe pkgs.wlogout}";
          tooltip = false;
        };

        "niri/window" = {
          separate-outputs = true;
          rewrite = {
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
            ".*Vesktop.*" = " Vesktop";
          };
        };

        "niri/workspaces" = {
          all-outputs = false;
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
          on-click = "${lib.getExe pkgs.iwmenu} -l rofi";
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
          on-click = "${lib.getExe pkgs.pwmenu} -l rofi";
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
        margin: 5px 9px 0;
        padding: 3px 0;
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
      #custom-wlogout {
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
      #custom-wlogout:hover {
        background-color: #${config.lib.stylix.colors.base0D};
        color: #${config.lib.stylix.colors.base00};
        border-radius: 5px;
      }

      #workspace {
        padding: 0 6px;
      }

      #workspaces button {
        background-color: #${config.lib.stylix.colors.base01};
        border-radius: 10px;
        margin: 1px 4px;
        min-width: 15px;
        min-height: 10px;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.active {
        background-color: #${config.lib.stylix.colors.base0D};
        min-width: 40px;
      }

      #workspaces button:hover {
        background-color: #${config.lib.stylix.colors.base0D};
      }

      #workspaces button.active:hover {
        background-color: #${config.lib.stylix.colors.base03};
      }

      #workspaces button.urgent {
        background-color: #${config.lib.stylix.colors.base08};
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
        background-color: #${config.lib.stylix.colors.base0D};
      }

      #battery.charging {
        border-radius: 5px;
        background: alpha(#${config.lib.stylix.colors.base0B}, 0.2);
        color: #${config.lib.stylix.colors.base0B};
      }

      #battery.critical:not(.charging),
      #network.disconnected {
        border-radius: 5px;
        background: alpha(#${config.lib.stylix.colors.base08}, 0.2);
        color: #${config.lib.stylix.colors.base08};
        animation: critical 1s ease-in-out infinite alternate;
      }

      @keyframes critical {
        0% { opacity: 1; }
        50% { opacity: 0.7; }
        100% { opacity: 1; }
      }
    '';
  };
}
