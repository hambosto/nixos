{
  config,
  pkgs,
  ...
}:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";
    themeConfig = with config.lib.stylix.colors.withHashtag; {
      Background = config.stylix.image;
      Font = config.stylix.fonts.monospace.name;
      FontSize = config.stylix.fonts.sizes.desktop;
      RoundCorners = 10;
      FullBlur = true;
      BlurMax = 64;
      Blur = 1.0;
      HeaderTextColor = base07;
      DateTextColor = base07;
      TimeTextColor = base07;
      FormBackgroundColor = base00;
      BackgroundColor = base00;
      DimBackgroundColor = base00;
      LoginFieldBackgroundColor = base01;
      PasswordFieldBackgroundColor = base01;
      LoginFieldTextColor = base07;
      PasswordFieldTextColor = base07;
      UserIconColor = base07;
      PasswordIconColor = base07;
      PlaceholderTextColor = base04;
      WarningColor = base02;
      LoginButtonTextColor = base07;
      LoginButtonBackgroundColor = base02;
      SystemButtonsIconsColor = base05;
      SessionButtonTextColor = base05;
      VirtualKeyboardButtonTextColor = base05;
      DropdownTextColor = base07;
      DropdownSelectedBackgroundColor = base02;
      DropdownBackgroundColor = base00;
      HighlightTextColor = base04;
      HighlightBackgroundColor = base02;
      HighlightBorderColor = base02;
      HoverUserIconColor = base0D;
      HoverPasswordIconColor = base0D;
      HoverSystemButtonsIconsColor = base0D;
      HoverSessionButtonTextColor = base0D;
      HoverVirtualKeyboardButtonTextColor = base0D;
    };
  };
in
{
  environment.systemPackages = [ sddm-astronaut ];
  services.displayManager.sddm = {
    enable = true;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
    ];
    theme = "sddm-astronaut-theme";
    wayland.enable = true;
  };
}
