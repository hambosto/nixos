{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      nerd-fonts.geist-mono
      nerd-fonts.ubuntu
    ];
  };
}
