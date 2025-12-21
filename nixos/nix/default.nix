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
      substituters = [
        "https://niri.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
  };
}
