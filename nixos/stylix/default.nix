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

    base16Scheme = {
      base00 = "0a0e1c";
      base01 = "121a2e";
      base02 = "1d2844";
      base03 = "2d3c59";
      base04 = "5e6b87";
      base05 = "a0a7c4";
      base06 = "c4c9db";
      base07 = "e5e8f0";
      base08 = "ff3ca1";
      base09 = "ff45b5";
      base0A = "a974ff";
      base0B = "3ee6dd";
      base0C = "00c3ff";
      base0D = "45a4ff";
      base0E = "d73aff";
      base0F = "a21fde";
    };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/HyDE-Project/hyde-themes/Catppuccin-Mocha/Configs/.config/hyde/themes/Catppuccin%20Mocha/wallpapers/aesthetic_deer.png";
    #   sha256 = "sha256-PAYE7IjDpUMNsZ94noVkggW3MHNHxA629omYTDtRae0=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/light-ring.jpg";
    #   sha256 = "sha256-BRgwIUqrQaut9hb94gIgtNtp9SQYFbf4lQhtQXYmahw=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/SwayKh/Wallpapers/main/Images/cat_lofi_cafe.png";
    #   sha256 = "sha256-yUW052i9IrjKnv7/7rpckJJUKbvlT/WzaZl1Fw9fuqI=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://www.kali.org/wallpapers/images/2023/kali-red-sticker.jpg";
    #   sha256 = "sha256-FnTCbNGeo0JFqa58rHwxyFszGQLzFPEWu8vQ8CSZ5yU=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/Immelancholy/NixDots/refs/heads/main/nixos/home/backgrounds/Evil_Miku.png";
    #   sha256 = "sha256-qP4/K8/85fHpEYdK5XtyAabmhBpy2n0XlnA17wSw0SE=";
    # };

    image = ../../assets/wallhaven-g7zqx7_1920x1200.png;

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
      fish.enable = false;
    };
  };
}
