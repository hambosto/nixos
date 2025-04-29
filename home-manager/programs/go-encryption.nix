{
  inputs,
  ...
}:
{
  imports = [ inputs.go-encryption.homeManagerModules.default ];

  programs.go-encryption.enable = false;
}
