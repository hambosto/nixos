{ pkgs, lib, ... }:
{
  home = {
    username = "ilham";
    homeDirectory = "/home/ilham";
    stateVersion = "24.11";
    pointerCursor.x11.enable = lib.mkForce false;

    packages = with pkgs; [ geminicommit ];
  };
}
