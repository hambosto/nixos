{
  lib,
  pkgs,
  ...
}:
let
  night-shift = pkgs.writeShellScriptBin "night-shift" ''
    if ${lib.getExe' pkgs.procps "pgrep"} -x "hyprsunset" > /dev/null; then
      ${lib.getExe' pkgs.procps "pkill"} -x hyprsunset
      ${lib.getExe pkgs.libnotify} "Night Light Disabled" "Screen color temperature reset to normal"
    else
      ${lib.getExe pkgs.hyprsunset} -t 3500 &
      ${lib.getExe pkgs.libnotify} "Night Light Enabled" "Screen color temperature set to 3500K"
    fi
  '';
in
{
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER SHIFT, N, exec, ${lib.getExe night-shift}"
  ];
}
