{ lib, pkgs, ... }:
let
  quit-workspace = pkgs.writeShellScriptBin "quit-workspace" ''
    active_workspace=$(${lib.getExe' pkgs.hyprland "hyprctl"} -j activeworkspace | ${lib.getExe pkgs.jq} -r '.id')
    addresses=$(${lib.getExe' pkgs.hyprland "hyprctl"} -j clients | ${lib.getExe pkgs.jq} -r ".[] | select(.workspace.id == $active_workspace) | .address")

    for address in $addresses; do
      ${lib.getExe' pkgs.hyprland "hyprctl"} dispatch closewindow address:$address
    done
  '';
in
{
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER SHIFT, Q, exec, ${lib.getExe quit-workspace}"
  ];
}
