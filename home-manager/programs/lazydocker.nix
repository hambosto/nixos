{ config, ... }:
{
  programs.lazydocker = {
    enable = false;
    settings.gui.theme = {
      activeBorderColor = [ "#${config.lib.stylix.colors.base0A}" ];
      inactiveBorderColor = [ "#${config.lib.stylix.colors.base03}" ];
      selectedLineBgColor = [ "#${config.lib.stylix.colors.base02}" ];
      optionsTextColor = [ "#${config.lib.stylix.colors.base0D}" ];
    };
  };
}
