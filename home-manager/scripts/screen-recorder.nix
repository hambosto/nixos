{
  config,
  lib,
  pkgs,
  ...
}:

let
  screen-recorder = pkgs.writeShellScriptBin "screen-recorder" ''
    OUTPUT="${config.home.homeDirectory}/Videos/screen-recording_$(date +%Y%m%d_%H%M%S).mp4"
    MONITOR=$(${lib.getExe' pkgs.pulseaudio "pactl"} get-default-sink).monitor

    mkdir -p "$(dirname "$OUTPUT")"
    echo "Recording → $OUTPUT (Ctrl+C to stop)"

    ${lib.getExe pkgs.wf-recorder} -f "$OUTPUT" -r 60 -c libx264rgb --audio="$MONITOR"

    echo "Saved: $OUTPUT"
  '';
in
{
  home.packages = [ screen-recorder ];
}
