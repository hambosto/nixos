{ lib, pkgs, ... }:
{
  environment = {
    defaultPackages = lib.mkForce [ ];
    systemPackages = with pkgs; [
      sbctl
      stdenv.cc
    ];
  };
}
