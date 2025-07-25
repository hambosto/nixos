{
  pkgs,
  ...
}:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ lua-language-server ];
  };
}
