{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    geminicommit
    gemini-cli
  ];
}
