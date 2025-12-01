{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.swww = {
    enable = true;
    extraArgs = [ "--no-cache" ];
  };

  home.activation.awww = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ${lib.getExe' pkgs.procps "pgrep"} -x "awww-daemon" > /dev/null; then
      ${lib.getExe pkgs.swww} img ${config.stylix.image}
    fi
  '';
}
