{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.user.services = {
    swww-daemon = {
      Unit = {
        PartOf = [ "hyprland-session.target" ];
        After = [ "hyprland-session.target" ];
      };
      Install.WantedBy = [ "hyprland-session.target" ];
      Service = {
        ExecStop = "${lib.getExe pkgs.swww} kill";
        ExecStart = "${lib.getExe' pkgs.swww "swww-daemon"}";
        Restart = "always";
        RestartSec = 10;
      };
    };

    swww-img = {
      Unit = {
        Requires = [ "swww-daemon.service" ];
        After = [ "swww-daemon.service" ];
        PartOf = [ "swww-daemon.service" ];
      };
      Install.WantedBy = [ "swww-daemon.service" ];
      Service = {
        Type = "oneshot";
        ExecStart = "${lib.getExe pkgs.swww} img ${config.stylix.image}";
        RemainAfterExit = true;
      };
    };
  };

  home.activation.swww = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${lib.getExe pkgs.swww} clear-cache
    ${lib.getExe pkgs.swww} img ${config.stylix.image}
  '';
}
