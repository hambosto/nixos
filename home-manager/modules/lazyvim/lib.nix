# lib extension for lazyvim module
{ lib, ... }:
let
  # Import the actual library functions from the lib directory
  lazyvimLib = import ./lib/default.nix { inherit lib; };
in
{
  lib.lazyvim = lazyvimLib;
}
