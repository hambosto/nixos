{
  config,
  inputs,
  lib,
  ...
}:
{
  nix = {
    channel.enable = false;
    registry = lib.mapAttrs (_: input: { flake = input; }) inputs;

    settings = {
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;

      experimental-features = [
        "flakes"
        "nix-command"
      ];

      extra-substituters = [ ];
      extra-trusted-public-keys = [ ];
      nix-path = lib.mapAttrsToList (name: value: "${name}=${value.to.path}") config.nix.registry;

      substituters = [
        "https://hambosto.cachix.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "hambosto.cachix.org-1:y8ajUwyukSGFdhV13wTsFbcqyITABZQ4bEW4pN8kUDg="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      trusted-users = [ "@wheel" ];
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
  };
}
