{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    image = ../../assets/minimalism.png;

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
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
