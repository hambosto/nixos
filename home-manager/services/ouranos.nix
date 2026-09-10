{ config, ... }:
{
  services.ouranos = {
    enable = true;
    settings = {
      image = config.stylix.image;

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

      transition = with config.lib.stylix.colors.withHashtag; {
        disc = {
          center_x = 0.5;
          center_y = 0.5;
        };

        duration = 1.5;
        edge_smoothness = 0.3;

        honeycomb = {
          cell_size = 0.04;
          center_x = 0.5;
          center_y = 0.5;
        };

        stripes = {
          angle = 30.0;
          stripe_count = 12.0;
        };

        transition_color = base00;
        transition_type = "honeycomb";

        wipe.direction = 0.0;
      };
    };
  };
}
