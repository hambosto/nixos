{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    geminicommit
  ];
}
