{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.user.services = {
    swww-daemon = {
      Install = {
        WantedBy = [ config.wayland.systemd.target ];
      };

      Unit = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
        Description = "swww-daemon";
        After = [ config.wayland.systemd.target ];
        PartOf = [ config.wayland.systemd.target ];
      };

      Service = {
        ExecStart = "${lib.getExe' pkgs.swww "swww-daemon"}";
        Restart = "always";
        RestartSec = 10;
      };
    };

    swww-img = {
      Install = {
        WantedBy = [ "swww-daemon.service" ];
      };

      Unit = {
        Description = "swww-img";
        Requires = [ "swww-daemon.service" ];
        After = [ "swww-daemon.service" ];
        PartOf = [ "swww-daemon.service" ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${lib.getExe pkgs.swww} img ${config.stylix.image} --transition-type right";
        Restart = "on-failure";
        RestartSec = 3;
      };
    };
  };
}
