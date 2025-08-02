{
  config,
  pkgs,
  ...
}:
{
  services.hypridle = {
    enable = true;
    settings = {

      general = {
        lock_cmd = "pidoff ${pkgs.swaylock-effects}/bin/swaylock || ${pkgs.swaylock-effects}/bin/swaylock";
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        after_sleep_cmd = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }

        {
          timeout = 660;
          on-timeout = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms off";
          on-resume = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms on";
        }

        {
          timeout = 1800;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
