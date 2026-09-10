{
  nix.settings = {
    allowed-users = [ "@wheel" ];
    auto-optimise-store = true;
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    extra-substituters = [ ];
    extra-trusted-public-keys = [ ];
    substituters = [
      "https://hambosto.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "hambosto.cachix.org-1:y8ajUwyukSGFdhV13wTsFbcqyITABZQ4bEW4pN8kUDg="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    trusted-users = [ "@wheel" ];
    warn-dirty = false;
  };
}
