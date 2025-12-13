{
  config,
  inputs,
  pkgs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];
  programs.spicetify = {
    enable = false;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      fullAppDisplay
    ];
    theme = spicePkgs.themes.text;
    colorScheme = "custom";
    customColorScheme = with config.lib.stylix.colors; {
      accent = base0D;
      accent-active = base0D;
      accent-inactive = base00;
      banner = base0E;
      border-active = base0D;
      border-inactive = base03;
      header = base01;
      highlight = base02;
      main = base00;
      notification = base0D;
      notification-error = base08;
      subtext = base03;
      text = base05;
    };
  };
}
