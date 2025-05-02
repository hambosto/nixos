{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ ginkgo ];
}
