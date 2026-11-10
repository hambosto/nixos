{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "041f24";
      base01 = "0e282e";
      base02 = "1c363c";
      base03 = "506b71";
      base04 = "849fa1";
      base05 = "b6d2d4";
      base06 = "c8e5e8";
      base07 = "d9f6f9";
      base08 = "ce625b";
      base09 = "a37f53";
      base0A = "798955";
      base0B = "5c8e6c";
      base0C = "4f8c96";
      base0D = "5989a2";
      base0E = "ab6fa4";
      base0F = "997e6f";
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
