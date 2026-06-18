{ config, ... }:
{
  services.wallpaper-rs = {
    enable = true;
    settings = {
      image.path = config.stylix.image;
      resize = {
        crop_gravity = "center";
        fill_color = [
          0
          0
          0
          255
        ];
        filter = "lanczos3";
        strategy = "crop";
      };
      transition = {
        duration = 3.0;
        fps = 30;

        fade.bezier = [
          0.54
          0.0
          0.34
          0.99
        ];

        radial = {
          bezier = [
            0.54
            0.0
            0.34
            0.99
          ];
          invert_y = false;
          pos = {
            x = 0.5;
            y = 0.5;
          };
          step = 90;
        };

        # transition_type: "none" | "simple" | "fade" | "grow" | "outer" | "wipe" | "wave"
        transition_type = "simple";

        wave = {
          angle = 45.0;
          bezier = [
            0.54
            0.0
            0.34
            0.99
          ];
          step = 90;
          wave = [
            20.0
            20.0
          ];
        };
      };
    };
  };
}
