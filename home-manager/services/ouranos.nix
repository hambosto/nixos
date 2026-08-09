{ config, ... }:
{
  services.ouranos = {
    enable = true;
    settings = {
      image.path = config.stylix.image;
      transition = with config.lib.stylix.colors.withHashtag; {
        transition_type = "honeycomb";
        duration = 1.5;
        edge_smoothness = 0.3;
        transition_color = base00;

        wipe.direction = 0.0;

        disc = {
          center_x = 0.5;
          center_y = 0.5;
        };

        stripes = {
          stripe_count = 12.0;
          angle = 30.0;
        };

        honeycomb = {
          cell_size = 0.04;
          center_x = 0.5;
          center_y = 0.5;
        };
      };

      resize = {
        strategy = "crop";
        crop_gravity = "center";
        fill_color = [
          0
          0
          0
          255
        ];
        filter = "lanczos3";
      };
    };
  };
}
