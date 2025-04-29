# {
#   config,
#   inputs,
#   lib,
#   pkgs,
#   ...
# }:
# let
#   flakeInputs = lib.filterAttrs (_: v: lib.isType "flake" v) inputs;
# in
{
  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";

    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # package = pkgs.lix;

    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    # registry = lib.mapAttrs (_: v: { flake = v; }) flakeInputs;

    # set the path for channels compat
    # nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

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

      # flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      # keep-derivations = true;
      # keep-outputs = true;

      max-jobs = "auto";
      substituters = [ ];
      trusted-public-keys = [ ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
  };
}
