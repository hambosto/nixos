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

      # Base16 background
      FormBackgroundColor = base00;
      BackgroundColor = base00;
      DimBackgroundColor = base00;

      # Base16 elevated/secondary background
      LoginFieldBackgroundColor = base01;
      PasswordFieldBackgroundColor = base01;

      # Base16 selection/accent background
      LoginButtonBackgroundColor = base02;
      DropdownSelectedBackgroundColor = base02;
      HighlightBackgroundColor = base02;
      HighlightBorderColor = base02;

      # Primary / secondary foreground
      HeaderTextColor = base06;
      DateTextColor = base05;
      TimeTextColor = base05;

      LoginFieldTextColor = base05;
      PasswordFieldTextColor = base05;
      LoginButtonTextColor = base05;
      DropdownTextColor = base05;

      # Muted / secondary foreground
      PlaceholderTextColor = base04;
      HighlightTextColor = base04;

      # Default foreground
      SystemButtonsIconsColor = base05;
      SessionButtonTextColor = base05;
      VirtualKeyboardButtonTextColor = base05;

      # Accent
      HoverUserIconColor = base0D;
      HoverPasswordIconColor = base0D;
      HoverSystemButtonsIconsColor = base0D;
      HoverSessionButtonTextColor = base0D;
      HoverVirtualKeyboardButtonTextColor = base0D;

      # Warning / error
      WarningColor = base08;
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
