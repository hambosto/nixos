{
  config,
  lib,
  pkgs,
  ...
}:
{

  systemd.user.services.awww = {
    Install.WantedBy = [ config.wayland.systemd.target ];
    Unit = {
      ConditionEnvironment = "WAYLAND_DISPLAY";
      After = [ config.wayland.systemd.target ];
      PartOf = [ config.wayland.systemd.target ];
    };

    Service = {
      ExecStart = "${lib.getExe' pkgs.awww "awww-daemon"} --no-cache";
      Restart = "on-failure";
      RestartSec = 10;
    };
  };

  home.activation.awww = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ${lib.getExe' pkgs.procps "pgrep"} -x "awww-daemon" > /dev/null; then
      ${lib.getExe pkgs.awww} img ${config.stylix.image}
    fi
  '';
}
