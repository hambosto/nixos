{
  imports = [
    # inputs.nixos-hardware.nixosModules.common-cpu-amd
    # inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    # inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
    ./configuration.nix
    ./bluetooth.nix
    ./graphics.nix
    ./wireless.nix
  ];
}
