{ pkgs, lib, ... }:
{
  home = {
    homeDirectory = "/home/ilham";
    packages = with pkgs; [
      geminicommit
      ssh-to-age
      sops
      sweetbyte-rs
    ];
    pointerCursor.x11.enable = lib.mkForce false;
    stateVersion = "24.11";
    username = "ilham";
  };
}
