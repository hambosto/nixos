{ inputs, pkgs, ... }:
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
      beautifulLyrics
      fullAppDisplay
    ];
    theme = spicePkgs.themes.lucid;
  };
}
