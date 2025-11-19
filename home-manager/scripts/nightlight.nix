{ lib, pkgs, ... }:
let
  nightlight = pkgs.writeShellScriptBin "nightlight" ''
    if ${lib.getExe' pkgs.procps "pgrep"} -x "hyprsunset" > /dev/null; then
      action="󰛨 Disable Night Light"
    else
      action="󰛩 Enable Night Light"
    fi

    selected=$(echo "$action" | ${lib.getExe pkgs.rofi} -dmenu -p "Night Light")

    if [ -n "$selected" ]; then
      if [[ "$selected" == *"Enable"* ]]; then
        ${lib.getExe pkgs.hyprsunset} -t 3500 &
        ${lib.getExe pkgs.libnotify} "Night Light Enabled" "Screen color temperature set to 3500K"
      elif [[ "$selected" == *"Disable"* ]]; then
        ${lib.getExe' pkgs.procps "pkill"} -x hyprsunset
        ${lib.getExe pkgs.libnotify} "Night Light Disabled" "Screen color temperature reset to normal"
      fi
    fi
  '';
in
{
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER SHIFT, N, exec, ${lib.getExe nightlight}"
  ];
}
