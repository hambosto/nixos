{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.nvchad4nix.homeManagerModule ];
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      gopls
      stylua
      unzip
    ];
    hm-activation = true;
    backup = false;
  };
}
