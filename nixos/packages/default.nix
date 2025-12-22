{ lib, pkgs, ... }:
{
  environment = {
    defaultPackages = lib.mkForce [ ];
    systemPackages = with pkgs; [
      nautilus
      sbctl
      stdenv.cc
    ];
  };
}
