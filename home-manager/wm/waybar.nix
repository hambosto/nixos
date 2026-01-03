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
          format = "󰥔 {:L%H:%M %Z}";
          tooltip = false;
        };

        "custom/rofi" = {
          format = "";
          on-click = "${lib.getExe pkgs.rofi} -show drun";
          tooltip-format = "Open the application launcher";
        };

        "custom/wlogout" = {
          format = "";
          on-click = "${lib.getExe pkgs.wlogout}";
          tooltip = false;
        };

        "niri/window" = {
          format = "{title}";
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
          format = "{icon}";
          format-icons = {
            default = "󰊠";
            active = "󰮯";
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

    style = with config.lib.stylix.colors.withHashtag; ''
      * {
        border: none;
        font-family: "Ubuntu Nerd Font";
        font-size: 14px;
        font-weight: bold;
        min-height: 32px;
      }

      window#waybar {
        background-color: transparent;
      }

      tooltip {
        background-color: ${base00};
        color: ${base05};
        border-radius: 5px;
        padding: 10px 16px;
        border: 2px solid ${base0D};
      }

      #custom-rofi,
      #workspaces,
      #window,
      #clock,
      #tray,
      #memory,
      #cpu,
      #pulseaudio,
      #network,
      #battery,
      #backlight,
      #power-profiles-daemon,
      #idle_inhibitor,
      #custom-wlogout {
        background-color: ${base00};
        border-top: 2px solid ${base0D};
        border-bottom: 2px solid ${base0D};
        margin: 6px 0;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      }

      #tray,
      #memory,
      #cpu,
      #pulseaudio,
      #network,
      #battery,
      #backlight,
      #power-profiles-daemon,
      #idle_inhibitor,
      #custom-wlogout {
        padding: 0 12px;
      }

      #custom-rofi,
      #tray,
      #memory {
        margin-left: 8px;
        border-left: 2px solid ${base0D};
        border-radius: 5px 0 0 5px;
      }

      #window,
      #custom-wlogout {
        margin-right: 8px;
        border-right: 2px solid ${base0D};
        border-radius: 0 5px 5px 0;
      }

      #custom-rofi {
        color: ${base08};
        padding: 0 14px;
      }

      #workspaces {
        padding: 0 4px;
      }

      #workspaces button {
        color: ${base04};
        padding: 0 8px;
        margin: 0 2px;
        min-width: 10px;
        border-radius: 5px;
      }

      #workspaces button.active {
        color: ${base0D};
        padding: 0 10px;
      }

      #workspaces button.urgent {
        background-color: ${base08};
        color: ${base00};
      }

      #workspaces button:hover {
        background-color: ${base02};
      }

      #window {
        color: ${base0C};
        padding: 0 14px;
      }

      #clock {
        color: ${base0E};
        padding: 0 20px;
        margin: 6px 8px;
        border: 2px solid ${base0D};
        border-radius: 5px;
      }

      #memory {
        color: ${base09};
      }

      #cpu {
        color: ${base0A};
      }

      #pulseaudio {
        color: ${base0C};
      }

      #network {
        color: ${base0B};
      }

      #battery {
        color: ${base0E};
      }

      #backlight {
        color: ${base0A};
      }

      #power-profiles-daemon {
        color: ${base09};
      }

      #idle_inhibitor {
        color: ${base0C};
      }

      #custom-wlogout {
        color: ${base08};
      }

      #custom-rofi:hover {
        background-color: ${base08};
        color: ${base00};
      }

      #memory:hover {
        background-color: ${base09};
        color: ${base00};
      }

      #cpu:hover {
        background-color: ${base0A};
        color: ${base00};
      }

      #pulseaudio:hover {
        background-color: ${base0C};
        color: ${base00};
      }

      #network:hover {
        background-color: ${base0B};
        color: ${base00};
      }

      #battery:hover {
        background-color: ${base0E};
        color: ${base00};
      }

      #backlight:hover {
        background-color: ${base0A};
        color: ${base00};
      }

      #power-profiles-daemon:hover {
        background-color: ${base09};
        color: ${base00};
      }

      #idle_inhibitor:hover {
        background-color: ${base0C};
        color: ${base00};
      }

      #custom-wlogout:hover {
        background-color: ${base08};
        color: ${base00};
      }

      #network.disconnected {
        color: ${base08};
      }

      #battery.charging {
        color: ${base0B};
      }

      #battery.critical:not(.charging) {
        color: ${base08};
      }
    '';
  };
}
