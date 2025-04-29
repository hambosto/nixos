{
  config,
  inputs,
  username,
  ...
}:
{
  imports = [ inputs.textfox.homeManagerModules.default ];

  textfox = {
    enable = false;
    profile = username;
    useLegacyExtensions = false;
    config = {
      displayNavButtons = true;

      background.color = "#${config.lib.stylix.colors.base00}";

      border = {
        color = "#${config.lib.stylix.colors.base0D}";
        width = "1px";
        transition = "1.0s ease";
        radius = "1px";
      };

      font = {
        family = "Ubuntu Nerd Font";
        size = "15px";
        accent = "#${config.lib.stylix.colors.base0D}";
      };

      tabs = {
        horizontal.enable = false;
        vertical.enable = true;
        vertical.margin = "1.0rem";
      };
    };
  };
}
