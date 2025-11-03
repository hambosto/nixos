{ inputs, ... }:
{
  imports = [ inputs.rust-nix.homeManagerModules.default ];

  programs.rust-nix.enable = false;
}
