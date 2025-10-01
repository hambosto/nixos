{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.user.services = {
    swww = {
      Install.WantedBy = [ config.wayland.systemd.target ];

      Unit = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
        After = [ config.wayland.systemd.target ];
        PartOf = [ config.wayland.systemd.target ];
      };

      Service = {
        ExecStart = "${lib.getExe' pkgs.swww "swww-daemon"} --no-cache";
        Restart = "always";
        RestartSec = 10;
      };
    };

    swww-img = {
      Install.WantedBy = [ "swww.service" ];

      Unit = {
        Requires = [ "swww.service" ];
        After = [ "swww.service" ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${lib.getExe pkgs.swww} img ${config.stylix.image}";
      };
    };
  };

  home.activation.swww = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ${lib.getExe' pkgs.procps "pgrep"} -x "swww-daemon" > /dev/null; then
      ${lib.getExe pkgs.swww} img ${config.stylix.image}
    fi
  '';
}
