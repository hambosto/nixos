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
    ${lib.getExe pkgs.swww} img ${config.stylix.image}
  '';
}
