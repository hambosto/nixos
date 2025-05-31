{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    # base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";

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
    #   base00 = "1b2330";
    #   base01 = "3f4e63";
    #   base02 = "596678";
    #   base03 = "7d8995";
    #   base04 = "9faab6";
    #   base05 = "c1c9d1";
    #   base06 = "e3e9ee";
    #   base07 = "f5f8fb";
    #   base08 = "e04e4b";
    #   base09 = "f48f39";
    #   base0A = "ffe75e";
    #   base0B = "71c189";
    #   base0C = "4bded1";
    #   base0D = "2ac3de";
    #   base0E = "9d79d6";
    #   base0F = "d36086";
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
    #   url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/lofi-urban_blue.png";
    #   sha256 = "sha256-YGBkEkjhiHT05ZCdzw29T8HkNqfv5IIs036F9QGS4SM=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/mylinuxforwork/wallpaper/refs/heads/main/marina-bay-sands.png";
    #   sha256 = "sha256-qVsCSAlUB+8GLDmlfSEOZ5/FNoFIPP04BhBCOkQyKkg=";
    # };

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/szymonwilczek/dotfiles/refs/heads/main/Arch/hollow-knight.jpg";
      sha256 = "sha256-dX3Xtf/Ma9UCzLfmRxnxLMHNL+IBjT2U06ruPmj5rHw=";
    };

    # image = ../../assets/game-room.png;

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
