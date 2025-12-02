{
  description = "A simple flake for an atomic system";

  inputs = {

    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      type = "github";
      owner = "nix-community";
      repo = "disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      type = "github";
      owner = "nix-community";
      repo = "lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4vscode = {
      type = "github";
      owner = "nix-community";
      repo = "nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      type = "github";
      owner = "Gerg-L";
      repo = "spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      type = "github";
      owner = "nix-community";
      repo = "stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sweetbyte = {
      type = "github";
      owner = "hambosto";
      repo = "sweetbyte";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.vivobook-m1403qa = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/configuration.nix ];
        specialArgs = { inherit inputs; };
      };
    };
}
