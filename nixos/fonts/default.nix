{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu
    maple-mono.NF
  ];
}
