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

  home.activation.swww = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ${lib.getExe' pkgs.procps "pgrep"} -x "swww-daemon" > /dev/null; then
      ${lib.getExe pkgs.swww} img ${config.stylix.image}
    fi
  '';
}
