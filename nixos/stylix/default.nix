{
  config,
  lib,
  pkgs,
  ...
}:
let
  # Configuration constants
  wallpaper = ../../assets/cosmic.png;

  # Generate color palette from wallpaper
  colorPalette =
    pkgs.runCommand "generate-palette"
      {
        buildInputs = [ pkgs.matugen ];
        meta.description = "Generated color palette from wallpaper";
      }
      ''
        ${lib.getExe pkgs.matugen} \
          --dry-run \
          --json strip \
          image ${wallpaper} > "$out"
      '';

  # Extract dark theme colors
  themeColors = (lib.importJSON colorPalette).colors.dark;
in
{
  stylix = {
    enable = true;

    # Base16 color scheme mapping
    # Maps Material You colors to Base16 color roles for consistent theming
    base16Scheme = {
      base00 = themeColors.background; # Default background
      base01 = themeColors.surface_container; # Lighter background
      base02 = themeColors.surface_container_highest; # Selection background
      base03 = themeColors.outline; # Comments, line highlighting
      base04 = themeColors.on_surface_variant; # Dark foreground
      base05 = themeColors.on_surface; # Default foreground
      base06 = themeColors.secondary_fixed; # Light foreground
      base07 = themeColors.on_primary_container; # Light background
      base08 = themeColors.error; # Variables, deletions
      base09 = themeColors.tertiary; # Constants, attributes
      base0A = themeColors.secondary; # Classes, search highlights
      base0B = themeColors.primary; # Strings, insertions
      base0C = themeColors.primary_fixed; # Support, regex
      base0D = themeColors.surface_tint; # Functions, headings
      base0E = themeColors.tertiary_fixed; # Keywords, storage
      base0F = themeColors.on_error_container; # Deprecated elements
    };

    image = wallpaper;

    polarity = "dark";

    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };

      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.harmonyos-sans;
        name = "HarmonyOS Sans";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 14;
      };
    };
  };
}
