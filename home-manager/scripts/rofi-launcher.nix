{
  pkgs,
  ...
}:
let
  rofi-launcher = pkgs.writeShellScriptBin "rofi-launcher" ''
    if [[ ! $(pidof rofi) ]]; then
    	rofi -show drun
    else
    	pkill rofi
    fi
  '';
in
{
  home.packages = [ rofi-launcher ];
}
