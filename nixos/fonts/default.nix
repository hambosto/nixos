{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
    ];

    enableDefaultPackages = false;
  };
}
