{ pkgs, lib, ... }:
{
  home = {
    enableNixpkgsReleaseCheck = false;
    homeDirectory = "/home/ilham";
    packages = with pkgs; [
      geminicommit
      sops
      sweetbyte-rs
    ];
    pointerCursor.x11.enable = lib.mkForce false;
    stateVersion = "24.11";
    username = "ilham";
  };
}
