{
  lib,
  pkgs,
  ...
}:
let
  screen-record = pkgs.writeShellScriptBin "screen-record" ''
    RECORD_PID_FILE="/tmp/screen_recording.pid"
    FRAMERATE="60"
    OUTPUT_LOCATION="$HOME/Videos"
    AUDIO_DEVICE=$(${lib.getExe' pkgs.pulseaudio "pactl"} get-default-sink)

    if [ -f "$RECORD_PID_FILE" ]; then
      kill "$(cat "$RECORD_PID_FILE")" && rm "$RECORD_PID_FILE"
      ${lib.getExe pkgs.libnotify} "Screen Recording Stopped" "Recording saved."
      exit 0
    fi

    mkdir -p "$OUTPUT_LOCATION"
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    OUTFILE="$OUTPUT_LOCATION/recording_$TIMESTAMP.mp4"

    ${lib.getExe pkgs.libnotify} "Screen Recording Started" "Recording at $FRAMERATE FPS. Saving to: $OUTFILE"

    ${lib.getExe pkgs.wf-recorder} \
      --audio="$AUDIO_DEVICE.monitor" \
      --codec h264_vaapi \
      --device /dev/dri/renderD128 \
      --file "$OUTFILE" \
      --framerate "$FRAMERATE" &

    echo $! > "$RECORD_PID_FILE"
  '';
in
{
  home.packages = [ screen-record ];
}
