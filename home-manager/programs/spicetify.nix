{
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
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      adblock
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
    windowManagerPatch = true;
  };
}
