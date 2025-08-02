{
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = false;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      unzip
      wl-clipboard
      ripgrep
    ];
  };
}
