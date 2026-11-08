{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "1c1e29";
      base01 = "181924";
      base02 = "30313e";
      base03 = "444653";
      base04 = "5a5c6a";
      base05 = "d3d6e6";
      base06 = "fbd4c7";
      base07 = "7c7f8d";
      base08 = "ff5835";
      base09 = "ff6a00";
      base0A = "b98a1d";
      base0B = "7a8968";
      base0C = "508a9a";
      base0D = "7693c9";
      base0E = "7177c5";
      base0F = "a77ecd";
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
    image = ../../assets/phone.png;
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
