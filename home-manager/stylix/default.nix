{
  pkgs,
  ...
}:
{
  stylix = {

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus";
      light = "Papirus";
    };

    targets = {
      spicetify.enable = false;
      vscode.enable = false;
      waybar.enable = false;
      fish.enable = true;
      qt.enable = true;
      gtk.enable = true;
      kitty.enable = true;
      neovim.enable = false;
      vencord.enable = false;
      swaync.enable = false;
      neovide.enable = false;
      cava.rainbow.enable = true;
    };
  };
}
