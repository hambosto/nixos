{ lib, pkgs, ... }:
{
  environment.defaultPackages = lib.mkForce [ ];
  environment.systemPackages = with pkgs; [ sbctl ];
}
