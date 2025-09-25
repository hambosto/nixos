{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.users.ilham = import ../../home-manager;

  home-manager.extraSpecialArgs = { inherit inputs; };
}
