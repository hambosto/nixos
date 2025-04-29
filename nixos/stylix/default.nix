{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    # base16Scheme = {
    #   base00 = "0a0b1a"; # Default Background - Deep Space Black
    #   base01 = "141526"; # Lighter Background - Midnight Core
    #   base02 = "1e1f35"; # Selection Background - Deep Navy
    #   base03 = "2b2d4d"; # Comments - Twilight Purple
    #   base04 = "4d4f7f"; # Dark Foreground - Mystic Violet
    #   base05 = "f8e2ff"; # Default Foreground - Cotton Candy White
    #   base06 = "ffd6f3"; # Light Foreground - Bubble Gum Pink
    #   base07 = "ffebf9"; # Light Background - Sweet Pink
    #   base08 = "ff3c7c"; # Variables - Hot Pink
    #   base09 = "ff5d4d"; # Integers - Cyber Red
    #   base0A = "ffcc00"; # Classes - Electric Yellow
    #   base0B = "00ff9f"; # Strings - Neon Green
    #   base0C = "00ffff"; # Support - Cyber Cyan
    #   base0D = "7c4dff"; # Functions - Deep Purple
    #   base0E = "f54fff"; # Keywords - Sugar Purple
    #   base0F = "ff6e9c"; # Deprecated - Strawberry Pink
    # };

    # base16Scheme = {
    #   base00 = "0c0e0f"; # Default Background
    #   base01 = "1c1e1f"; # Lighter Background (Used for status bars, line number and folding marks)
    #   base02 = "313244"; # Selection Background
    #   base03 = "45475a"; # Comments, Invisibles, Line Highlighting
    #   base04 = "585b70"; # Dark Foreground (Used for status bars)
    #   base05 = "cdd6f4"; # Default Foreground, Caret, Delimiters, Operators
    #   base06 = "f5e0dc"; # Light Foreground (Not often used)
    #   base07 = "b4befe"; # Light Background (Not often used)
    #   base08 = "f38ba8"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    #   base09 = "fab387"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
    #   base0A = "f9e2af"; # Classes, Markup Bold, Search Text Background
    #   base0B = "a6e3a1"; # Strings, Inherited Class, Markup Code, Diff Inserted
    #   base0C = "94e2d5"; # Support, Regular Expressions, Escape Characters, Markup Quotes
    #   base0D = "c4a7e7"; # Functions, Methods, Attribute IDs, Headings, Accent color
    #   base0E = "cba6f7"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
    #   base0F = "f2cdcd"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    # };

    # base16Scheme = {
    #   base00 = "17181C";
    #   base01 = "1E1F24";
    #   base02 = "26272B";
    #   base03 = "333438";
    #   base04 = "8F9093";
    #   base05 = "B0B1B4";
    #   base06 = "CBCCCE";
    #   base07 = "E4E5E7";
    #   base08 = "FA3867";
    #   base09 = "F3872F";
    #   base0A = "FEBD16";
    #   base0B = "3FD43B";
    #   base0C = "47E7CE";
    #   base0D = "53ADE1";
    #   base0E = "AD60FF";
    #   base0F = "FC3F2C";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/HyDE-Project/hyde-themes/Catppuccin-Mocha/Configs/.config/hyde/themes/Catppuccin%20Mocha/wallpapers/aesthetic_deer.png";
    #   sha256 = "sha256-PAYE7IjDpUMNsZ94noVkggW3MHNHxA629omYTDtRae0=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/light-ring.jpg";
    #   sha256 = "sha256-BRgwIUqrQaut9hb94gIgtNtp9SQYFbf4lQhtQXYmahw=";
    # };

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/SwayKh/Wallpapers/main/Images/cat_lofi_cafe.png";
      sha256 = "sha256-yUW052i9IrjKnv7/7rpckJJUKbvlT/WzaZl1Fw9fuqI=";
    };

    # image = pkgs.fetchurl {
    #   url = "https://www.kali.org/wallpapers/images/2023/kali-red-sticker.jpg";
    #   sha256 = "sha256-FnTCbNGeo0JFqa58rHwxyFszGQLzFPEWu8vQ8CSZ5yU=";
    # };

    polarity = "dark";

    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Mono";
      };

      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
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

    opacity = {
      terminal = 0.7;
    };

    targets = {
      chromium.enable = false;
    };
  };
}
