{ config, pkgs, ... }:
{
  stylix = {
    enable = true;

    image = ../../assets/cityspace.png;

    polarity = "dark";
    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.nur.repos.guanran928.harmonyos-sans;
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
