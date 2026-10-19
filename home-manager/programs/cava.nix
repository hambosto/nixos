{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
        autosens = 1;
        bars = 0; # auto-fit to terminal width
        bar_width = 2;
        bar_spacing = 1;
        # Most music has little energy above ~16 kHz, so a 22 kHz cutoff
        # leaves the rightmost bars nearly flat. 16 kHz uses the bars better.
        higher_cutoff_freq = 16000;
      };
      input = {
        method = "pipewire";
        source = "auto";
      };
      output = {
        method = "noncurses";
        channels = "mono";
        mono_option = "average";
      };
      smoothing = {
        monstercat = 0; # no spatial smoothing between neighbouring bars
        waves = 0;
        # Single knob for both attack and fall-off. Lower is snappier.
        # 15-20 tracks the beat tightly while still falling smoothly.
        noise_reduction = 18;
      };
    };
  };
}
