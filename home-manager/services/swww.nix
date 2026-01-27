{
  config,
  lib,
  pkgs,
  ...
}:
{

  systemd.user.services.swww = {
    Install.WantedBy = [ config.wayland.systemd.target ];

    Service = {
      ExecStart = "${lib.getExe' pkgs.swww "swww-daemon"} --no-cache";
      Restart = "on-failure";
      RestartSec = 10;
    };

    Unit = {
      ConditionEnvironment = "WAYLAND_DISPLAY";
      After = [ config.wayland.systemd.target ];
      PartOf = [ config.wayland.systemd.target ];
    };
  };

  home.activation.swww = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ${lib.getExe' pkgs.procps "pgrep"} -x ".swww-daemon-wr" > /dev/null; then
      ${lib.getExe pkgs.swww} img ${config.stylix.image}
    fi
  '';
}
