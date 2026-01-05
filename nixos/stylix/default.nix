{ config, pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    enableReleaseChecks = false;
    image = ../../assets/village.jpg;
    polarity = "dark";
    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };

    fonts = {
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      monospace = {
        package = pkgs.nerd-fonts.geist-mono;
        name = "GeistMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.harmonyos-sans;
        name = "HarmonyOS Sans";
      };

      serif = config.stylix.fonts.sansSerif;

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
