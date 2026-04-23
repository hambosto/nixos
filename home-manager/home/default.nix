{ pkgs, lib, ... }:
{
  home = {
    homeDirectory = "/home/ilham";
    packages = with pkgs; [
      gcop-rs
      ssh-to-age
      sops
      sweetbyte-rs
      stdenv.cc
    ];
    pointerCursor.x11.enable = lib.mkForce false;
    stateVersion = "24.11";
    username = "ilham";
  };
}
