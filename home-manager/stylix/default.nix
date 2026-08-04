{
  stylix = {
    enableReleaseChecks = false;
    targets = import ./targets.nix;
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
