{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      maple-mono.NF
      nerd-fonts.ubuntu
      font-collections.sf-mono-nf
    ];
  };
}
