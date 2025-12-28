{ config, pkgs, ... }:
{
  stylix = {
    enable = true;

    enableReleaseChecks = false;

    image = ../../assets/marina-bay-sands-catppuccin.png;

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
        package = pkgs.font-collections.harmonyos-sans;
        name = "HarmonyOS Sans";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 14;
      };
    };

    targets = import ./targets.nix;
  };
}
