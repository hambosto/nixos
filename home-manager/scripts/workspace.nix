{
  config,
  lib,
  pkgs,
  ...
}:
let
  quit-workspace = pkgs.writeShellScriptBin "quit-workspace" ''
    active_workspace=$(${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} -j activeworkspace | ${lib.getExe pkgs.jq} -r '.id')
    addresses=$(${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} -j clients | ${lib.getExe pkgs.jq} -r ".[] | select(.workspace.id == $active_workspace) | .address")

    for address in $addresses; do
      ${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch closewindow address:$address
    done
  '';
in
{
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER SHIFT, Q, exec, ${lib.getExe quit-workspace}"
  ];
}
