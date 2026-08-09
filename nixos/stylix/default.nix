{
  config,
  lib,
  pkgs,
  ...
}:
let
  image = ../../assets/sakura.jpg;
  scheme = pkgs.runCommand "scheme.json" { } ''
    ${lib.getExe pkgs.iridion} -i ${image} > $out
  '';
  base16Scheme = builtins.fromJSON (builtins.readFile scheme);
in
{
  stylix = {
    inherit base16Scheme image;
    enable = true;

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
      serif = config.stylix.fonts.sansSerif;
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
