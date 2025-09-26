{ pkgs, ... }:
{
  home = {
    username = "ilham";
    homeDirectory = "/home/ilham";
    stateVersion = "24.11";

    packages = with pkgs; [ geminicommit ];
  };
}
