{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "1a2022";
      base01 = "161b1d";
      base02 = "2e3336";
      base03 = "42484b";
      base04 = "585e61";
      base05 = "d1d8dc";
      base06 = "e9d9d7";
      base07 = "7a8184";
      base08 = "a37c75";
      base09 = "e17757";
      base0A = "abaa93";
      base0B = "889d95";
      base0C = "79939b";
      base0D = "758890";
      base0E = "7a808b";
      base0F = "91818b";
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
    image = ../../assets/kimono.png;
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
