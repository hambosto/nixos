{
  pkgs,
  ...
}:
{
  programs.nix-ld.enable = false;
  programs.nix-ld.libraries = with pkgs; [ ];
}
