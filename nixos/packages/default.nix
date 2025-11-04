{ lib, pkgs, ... }:
{
  environment = {
    defaultPackages = lib.mkForce [ ];
    systemPackages = with pkgs; [
      stdenv.cc
      sbctl
    ];
  };
}
