{ lib, pkgs, ... }:
{
  environment = {
    defaultPackages = lib.mkForce [ ];
    systemPackages = with pkgs; [
      sbctl
      nautilus
      stdenv.cc
    ];
  };
}
