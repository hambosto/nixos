{
  lib,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.x86_64-linux;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
    enable = false;
    theme = lib.mkForce spicePkgs.themes.text;
    colorScheme = "TokyoNight";
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      adblock
      fullAppDisplay
    ];
    enabledCustomApps = with spicePkgs.apps; [
      ncsVisualizer
      lyricsPlus
      newReleases
    ];
    windowManagerPatch = true;
  };
}
