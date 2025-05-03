{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "24283b";
      base01 = "1f2335";
      base02 = "292e42";
      base03 = "565f89";
      base04 = "a9b1d6";
      base05 = "c0caf5";
      base06 = "c0caf5";
      base07 = "c0caf5";
      base08 = "f7768e";
      base09 = "ff9e64";
      base0A = "e0af68";
      base0B = "9ece6a";
      base0C = "1abc9c";
      base0D = "41a6b5";
      base0E = "bb9af7";
      base0F = "ff007c";
    };

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

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/hambosto/nixos/refs/heads/main/assets/marina-bay-sands.png";
      sha256 = "sha256-qVsCSAlUB+8GLDmlfSEOZ5/FNoFIPP04BhBCOkQyKkg=";
    };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/hambosto/nixos/refs/heads/main/assets/changi-airport.png";
    #   sha256 = "sha256-4V+97kboALo9d+/CmBnuKsTYOpa/2AvBBnxwxNVxe6U=";
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
      fish.enable = false;
    };
  };
}
