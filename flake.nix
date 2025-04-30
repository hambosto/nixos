{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    wallpaper-manager = {
      url = "github:hambosto/wallpaper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    go-encryption = {
      url = "github:hambosto/go-encryption";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    textfox = {
      url = "github:adriankarlen/textfox";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad-starter = {
      url = "github:hambosto/nvchad";
      flake = false;
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvchad-starter";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      hostname = "vivobook-m1403qa";
      username = "ilham";
      fullname = "Ilham Putra Husada";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit hostname;
          inherit fullname;
        };
        modules = [
          ./nixos/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
              inherit hostname;
              inherit system;
              inherit fullname;
            };
            home-manager.users.${username} = import ./home-manager;
          }
        ];
      };
    };
}
