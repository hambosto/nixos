{ config, pkgs, ... }:
{
  stylix = {
    enable = true;
    cursor = {
      name = "macOS";
      package = pkgs.apple-cursor;
      size = 24;
    };
    enableReleaseChecks = false;
    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "GeistMono Nerd Font";
        package = pkgs.nerd-fonts.geist-mono;
      };
      sansSerif = {
        name = "HarmonyOS Sans";
        package = pkgs.harmonyos-sans;
      };
      serif = config.stylix.fonts.sansSerif;
      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 14;
      };
    };
    image = ../../assets/wloop.png;
    polarity = "dark";
    targets = import ./targets.nix;
  };
}
