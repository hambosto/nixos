{
  lib,
  ...
}:
{
  programs.kitty = {
    enable = true;

    settings = {
      background_blur = 10;
      background_opacity = lib.mkForce 0.4;
      bold_font = "auto";
      bold_italic_font = "auto";
      confirm_os_window_close = 0;
      cursor_blink = true;
      cursor_blink_interval = 0.5;
      cursor_shape = "block";
      cursor_trail = 10;
      cursor_trail_decay = "0.01 0.15";
      cursor_trail_start_threshold = 0;
      dynamic_background_opacity = "yes";
      enable_audio_bell = "no";
      font_family = lib.mkForce "JetBrainsMono Nerd Font";
      font_size = 12;
      hide_window_decorations = "yes";
      initial_window_height = 500;
      initial_window_width = 950;
      italic_font = "auto";
      remember_window_size = "no";
      scrollback_lines = 2000;
      selection_background = "none";
      selection_foreground = "none";
      shell_integration = true;
      wheel_scroll_min_lines = 1;
      window_padding_width = 10;
    };
  };
}
