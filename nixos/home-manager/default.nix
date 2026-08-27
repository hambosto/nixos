{ inputs, ... }:
{
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ilham = import ../../home-manager;
  home-manager.sharedModules = [
    inputs.noctalia.homeManagerModules.noctalia
    inputs.noctalia.homeManagerModules.umbriel
    inputs.ouranos.homeManagerModules.default
  ];
}
