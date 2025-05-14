{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ stdenv.cc ];
}
