{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu
    nerd-fonts.geist-mono
  ];
}
