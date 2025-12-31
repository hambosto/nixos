{ config, ... }:
{
  programs.lazydocker = {
    enable = false;
    settings.gui.theme = with config.lib.stylix.colors.withHashtag; {
      activeBorderColor = [ base0A ];
      inactiveBorderColor = [ base03 ];
      selectedLineBgColor = [ base02 ];
      optionsTextColor = [ base0D ];
    };
  };
}
