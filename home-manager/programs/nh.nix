{ config, ... }:
{
  programs.nh = {
    enable = false;
    flake = "${config.xdg.configHome}/nixos";
  };
}
