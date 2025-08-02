{
  pkgs,
  ...
}:
{
  programs.nix-ld = {
    enable = false;
    libraries = with pkgs; [ lua-language-server ];
  };
}
