{ inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
    ./boot
    ./disko
    ./docs
    ./environment
    ./fonts
    ./hardware
    ./home-manager
    ./i18n
    ./networking
    ./nix
    ./nixpkgs
    ./packages
    ./programs
    ./security
    ./services
    ./stylix
    ./system
    ./time
    ./users
    ./virtualisation
  ];
}
