{ inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.stylix.nixosModules.stylix
    inputs.lanzaboote.nixosModules.lanzaboote
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
