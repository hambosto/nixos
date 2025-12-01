{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    font = lib.mkForce {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = lib.mkForce {
      background_opacity = 0.5;
      bold_font = "auto";
      bold_italic_font = "auto";
      cursor_blink = true;
      cursor_blink_interval = 0.5;
      cursor_shape = "block";
      cursor_stop_blinking_after = 1;
      cursor_trail = 10;
      cursor_trail_decay = "0.01 0.15";
      cursor_trail_start_threshold = 0;
      enable_audio_bell = "no";
      hide_window_decorations = "yes";
      initial_window_height = 500;
      initial_window_width = 950;
      remember_window_size = "no";
      scrollback_lines = 2000;
      selection_background = "none";
      selection_foreground = "none";
      wheel_scroll_min_lines = 1;
      window_padding_width = 0;
      dynamic_background_opacity = "yes";
      confirm_os_window_close = 0;
    };
  };
}
