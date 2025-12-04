{
  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";

    optimise.automatic = true;
    settings = {
      accept-flake-config = false;
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      extra-substituters = [ ];
      extra-trusted-public-keys = [ ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      max-jobs = "auto";
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
  };
}
