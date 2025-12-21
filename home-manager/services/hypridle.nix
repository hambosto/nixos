{ lib, pkgs, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "${lib.getExe pkgs.hyprlock}";
        before_sleep_cmd = "${lib.getExe' pkgs.systemd "loginctl"} lock-session";
        after_sleep_cmd = "${lib.getExe pkgs.niri-unstable} msg power-on-monitors";
      };
      listener = [
        {
          timeout = 120;
          on-timeout = "${lib.getExe pkgs.brightnessctl} -s set 10";
          on-resume = "${lib.getExe pkgs.brightnessctl} -r";
        }
        {
          timeout = 120;
          on-timeout = "${lib.getExe pkgs.brightnessctl} -sd asus::kbd_backlight set 0";
          on-resume = "${lib.getExe pkgs.brightnessctl} -rd asus::kbd_backlight";
        }
        {
          timeout = 180;
          on-timeout = "${lib.getExe' pkgs.systemd "loginctl"} lock-session";
        }
        {
          timeout = 240;
          on-timeout = "${lib.getExe pkgs.niri-unstable} msg power-off-monitors";
          on-resume = "${lib.getExe pkgs.niri-unstable} msg power-on-monitors && ${lib.getExe pkgs.brightnessctl} -r";
        }
        {
          timeout = 300;
          on-timeout = "${lib.getExe' pkgs.systemd "systemctl"} suspend";
        }
      ];
    };
  };
}
