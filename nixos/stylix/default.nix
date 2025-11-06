{ pkgs, ... }:
{
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "#1F1F28";
      base01 = "#16161D";
      base02 = "#223249";
      base03 = "#54546D";
      base04 = "#727169";
      base05 = "#DCD7BA";
      base06 = "#C8C093";
      base07 = "#717C7C";
      base08 = "#C34043";
      base09 = "#FFA066";
      base0A = "#C0A36E";
      base0B = "#76946A";
      base0C = "#6A9589";
      base0D = "#7E9CD8";
      base0E = "#957FB8";
      base0F = "#D27E99";
    };

    image = ../../assets/kanagawa.jpg;

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

      serif = {
        package = pkgs.source-serif-pro;
        name = "Source Serif Pro";
      };

      sansSerif = {
        package = pkgs.source-sans-pro;
        name = "Source Sans Pro";
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
