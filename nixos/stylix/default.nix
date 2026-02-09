{ config, pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "090E13";
      base01 = "12171E";
      base02 = "393B44";
      base03 = "54546D";
      base04 = "A4A7A4";
      base05 = "C5C9C7";
      base06 = "DCD7BA";
      base07 = "C8C093";
      base08 = "C4746E";
      base09 = "B6927B";
      base0A = "C4B28A";
      base0B = "8A9A7B";
      base0C = "8EA4A2";
      base0D = "8BA4B0";
      base0E = "A292A3";
      base0F = "B98D7B";
    };
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
    image = ../../assets/rain-pixel.png;
    polarity = "dark";
    targets = import ./targets.nix;
  };
}
