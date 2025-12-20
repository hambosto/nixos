{ inputs, ... }:
{
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.ilham = import ../../home-manager;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
