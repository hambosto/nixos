{ pkgs, ... }:
{
  nix = {
    channel.enable = false;
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
      substituters = [ ];
      trusted-public-keys = [ ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
  };

  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };
}
