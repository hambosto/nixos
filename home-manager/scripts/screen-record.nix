{
  config,
  lib,
  pkgs,
  ...
}:
let
  screen-record = pkgs.writeShellScriptBin "screen-record" ''
    FRAMERATE="60"
    OUTPUT_LOCATION="$HOME/Videos"
    AUDIO_DEVICE=$(${lib.getExe' pkgs.pulseaudio "pactl"} get-default-sink)

    if pgrep -x "wf-recorder" > /dev/null; then
      pkill wf-recorder
      ${lib.getExe pkgs.libnotify} "Screen Recording Stopped" "The screen recording has ended. Your video has been saved to the Videos folder."
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
  '';
in
{
  home.packages = lib.mkIf config.programs.waybar.enable [ screen-record ];
}
