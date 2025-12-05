{ inputs, ... }:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.ilham = import ../../home-manager;
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
