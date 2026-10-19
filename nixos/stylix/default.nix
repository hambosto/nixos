{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "1c1f22";
      base01 = "171b1d";
      base02 = "2f3336";
      base03 = "44484b";
      base04 = "595e61";
      base05 = "d3d8db";
      base06 = "d9dee2";
      base07 = "8b7c79";
      base08 = "aa817a";
      base09 = "b7a6a1";
      base0A = "cf9e33";
      base0B = "9abfb2";
      base0C = "768589";
      base0D = "9facb5";
      base0E = "7a808a";
      base0F = "a392a3";
    };
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    enableReleaseChecks = false;
    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono.NF-unhinted;
      };
      sansSerif = {
        name = "HarmonyOS Sans";
        package = pkgs.harmonyos-sans;
      };
      serif = {
        name = "HarmonyOS Sans";
        package = pkgs.harmonyos-sans;
      };
      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 11;
      };
    };
    icons = {
      enable = true;
      package = pkgs.colloid-icon-theme;
      dark = "Colloid-Dark";
      light = "Colloid-Light";
    };
    image = ../../assets/porsche.png;
    opacity = {
      applications = 0.7;
      desktop = 0.7;
      popups = 0.7;
      terminal = 0.7;
    };
    polarity = "dark";
    targets = import ./targets.nix;
  };
}
