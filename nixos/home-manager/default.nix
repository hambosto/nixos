{ inputs, ... }:
{
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ilham = import ../../home-manager;
  home-manager.sharedModules = [
    inputs.nix-zed-extensions.homeManagerModules.default
    inputs.sops-nix.homeManagerModules.sops
    inputs.wallpaper-rs.homeManagerModules.default
  ];
}
