{
  config,
  lib,
  pkgs,
  ...
}:
let
  blue-light = pkgs.writeShellScriptBin "blue-light" ''
    if pgrep -x "hyprsunset" > /dev/null; then
      ${lib.getExe pkgs.libnotify} "Blue Light Filter Disabled" "The blue light filter has been turned off."
      pkill hyprsunset
    else
      ${lib.getExe pkgs.libnotify} "Blue Light Filter Enabled" "The blue light filter is now on at 3500K."
      ${lib.getExe pkgs.hyprsunset} -t 3500 &
    fi
  '';
in
{
  home.packages = lib.mkIf config.programs.waybar.enable [ blue-light ];
}
