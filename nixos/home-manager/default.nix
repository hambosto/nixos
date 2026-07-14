{ inputs, ... }:
{
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ilham = import ../../home-manager;
  home-manager.sharedModules = [
    inputs.niri-nix.homeManagerModules.default
    inputs.noctalia.homeModules.default
    inputs.wallpaper-rs.homeManagerModules.default
  ];
}
