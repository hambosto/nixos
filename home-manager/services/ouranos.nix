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
        duration = 1.5;
        edge_smoothness = 0.3;
        transition_color = base00;
        transition_type = "honeycomb";
      };
    };
  };
}
