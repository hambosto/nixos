{ inputs, pkgs, ... }:
{
  imports = [ inputs.lazyvim.homeManagerModules.default ];

  programs.lazyvim = {
    enable = false;

    extras = {
      lang.go = {
        enable = true;
        installDependencies = true; # Install gopls, gofumpt, etc.
      };
    };

    extraPackages = with pkgs; [
      tree-sitter
    ];
  };

}
