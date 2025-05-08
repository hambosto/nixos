{
  lib,
  pkgs,
  ...
}:
let
  blue-light = pkgs.writeShellScriptBin "blue-light" ''
    NIGHT_TEMP="3500"

    if pgrep -x "hyprsunset" > /dev/null; then
      pkill hyprsunset
      ${lib.getExe pkgs.libnotify} "Blue Light Filter Disabled" "Your screen has returned to normal color temperature."
      exit 0
    fi

    ${lib.getExe pkgs.hyprsunset} -t "$NIGHT_TEMP" > /dev/null 2>&1 &
    ${lib.getExe pkgs.libnotify} "Blue Light Filter Enabled" "Your screen has been adjusted to reduce blue light (3500K)."
  '';
in
{
  home.packages = [ blue-light ];
}
