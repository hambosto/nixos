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
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hambosto.cachix.org-1:4mJ7QHKfvtCwHSLJRd9ku3ipkSTLUGSjZFDpH5OcEK4="
    ];
    warn-dirty = false;
  };
}
