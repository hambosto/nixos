{ lib, pkgs, ... }:
let
  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    shutdown="󰐥 Shutdown"
    reboot="󰜉 Reboot"
    lock="󰌾 Lock"
    suspend="󰤄 Suspend"
    logout="󰍃 Logout"

    rofi_cmd() {
      ${lib.getExe pkgs.rofi} -dmenu -p "Power Menu"
    }

    run_rofi() {
      {
        echo "$shutdown"
        echo "$reboot"
        echo "$suspend"
        echo "$lock"
        echo "$logout"
      } | rofi_cmd
    }

    chosen="$(run_rofi)"

    case "$chosen" in
      "$shutdown")
        ${lib.getExe' pkgs.systemd "systemctl"} poweroff
        ;;
      "$reboot")
        ${lib.getExe' pkgs.systemd "systemctl"} reboot
        ;;
      "$suspend")
        ${lib.getExe' pkgs.systemd "systemctl"} suspend
        ;;
      "$logout")
        ${lib.getExe' pkgs.hyprland "hyprctl"} dispatch exit
        ;;
      "$lock")
        ${lib.getExe pkgs.hyprlock}
        ;;
    esac
  '';
in
{
  programs.waybar.settings.mainBar = {
    "custom/powermenu" = {
      on-click = "${lib.getExe powermenu}";
    };
  };
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER SHIFT, P, exec, ${lib.getExe powermenu}"
  ];
}
