{
  lib,
  pkgs,
  ...
}:
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${lib.getExe pkgs.swaylock-effects}";
      }
      {
        event = "lock";
        command = "${lib.getExe pkgs.swaylock-effects}";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${lib.getExe pkgs.swaylock-effects}";
      }
      {
        timeout = 600;
        command = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms off";
        resumeCommand = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms on";
      }
      {
        timeout = 1000;
        command = "${lib.getExe' pkgs.systemd "systemctl"} suspend";
        resumeCommand = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms on";
      }
    ];
  };
}
