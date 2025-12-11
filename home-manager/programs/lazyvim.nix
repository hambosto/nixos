{
  programs.lazyvim = {
    enable = false;
    go.enable = true;
    extraSpec = ''
      { "folke/tokyonight.nvim", opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }},
    '';
  };
}
