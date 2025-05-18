{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";

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
    #   url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/tokyo.png";
    #   sha256 = "sha256-sI9qTHXXU/kZEvWLXCfFplQat3IiBfY1cdjo7j1Nh64=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/tokyo-skyscraper_dark.png";
    #   sha256 = "sha256-SdEHTWHSdd66JGoVPYTFZyCVuiPDRCt8Eadq6OjL4s0=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/space-2.png";
    #   sha256 = "sha256-OYr+ina6iXpXH9g4AyddZEdWImIXceq/P111VQ+VFV8=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/aurora.png";
    #   sha256 = "sha256-IJjGUJC/B5U2jkypU29UKHMIVvg/VjCVzCR+evvjPXU=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/lofi-urban_blue.png";
    #   sha256 = "sha256-YGBkEkjhiHT05ZCdzw29T8HkNqfv5IIs036F9QGS4SM=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/paint-loop_art.png";
    #   sha256 = "sha256-OY+voBy5cyeJxB/Udje3JZfYAn2+x6X0xC7SpfE+lB0=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/mylinuxforwork/wallpaper/refs/heads/main/marina-bay-sands.png";
    #   sha256 = "sha256-qVsCSAlUB+8GLDmlfSEOZ5/FNoFIPP04BhBCOkQyKkg=";
    # };

    image = ../../assets/abstract-purple.png;

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

  };
}
