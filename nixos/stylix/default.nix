{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "0f1d20";
      base01 = "182729";
      base02 = "273638";
      base03 = "58696c";
      base04 = "969d96";
      base05 = "cdd3cc";
      base06 = "dde3dd";
      base07 = "edf4ed";
      base08 = "f07b68";
      base09 = "fd886d";
      base0A = "f1cda2";
      base0B = "8db08c";
      base0C = "82bfc7";
      base0D = "5398a6";
      base0E = "9fb0da";
      base0F = "ae766a";
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
    image = ../../assets/marina-bay-sands.png;
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
