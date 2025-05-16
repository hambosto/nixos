{
  inputs,
  ...
}:
{
  imports = [ inputs.hexwarden.homeManagerModules.default ];

  programs.hexwarden.enable = false;
}
