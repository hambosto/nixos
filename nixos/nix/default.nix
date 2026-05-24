{
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    extra-substituters = [ ];
    extra-trusted-public-keys = [ ];
    substituters = [
      "https://nix-community.cachix.org"
      "https://hambosto.cachix.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hambosto.cachix.org-1:y8ajUwyukSGFdhV13wTsFbcqyITABZQ4bEW4pN8kUDg="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
    warn-dirty = false;
  };
}
