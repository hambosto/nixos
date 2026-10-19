{ config, lib, ... }:
{
  programs.kitty = {
    enable = true;
    font = lib.mkForce {
      name = config.stylix.fonts.monospace.name;
      size = config.stylix.fonts.sizes.terminal;
    };
    settings = {
      background_blur = 10;
      background_opacity = lib.mkForce config.stylix.opacity.terminal;
      bold_font = "auto";
      bold_italic_font = "auto";
      confirm_os_window_close = 0;
      cursor_blink_interval = 0.5;
      cursor_shape = "block";
      cursor_stop_blinking_after = 1;
      dynamic_background_opacity = "yes";
      enable_audio_bell = "no";
      hide_window_decorations = "yes";
      initial_window_height = 500;
      initial_window_width = 950;
      remember_window_size = "no";
      scrollback_lines = 2000;
      selection_background = "none";
      selection_foreground = "none";
      wheel_scroll_min_lines = 1;
      window_margin_width = 0;
      window_padding_width = 0;
    };
  };
}
