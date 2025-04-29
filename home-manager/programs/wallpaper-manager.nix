{ inputs, ... }:
{
  imports = [ inputs.wallpaper-manager.homeManagerModules.default ];

  programs.wallpaper-manager = {
    enable = false;
    # wallust = {
    #   enable = true;
    #   integrations = {
    #     hyprland = true;
    #   };
    # };
  };
}
