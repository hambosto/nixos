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
      cava.rainbow.enable = true;
      firefox.enable = false;
      fish.enable = true;
      gtk.enable = true;
      hyprland.hyprpaper.enable = false;
      kitty.enable = true;
      neovide.enable = false;
      neovim.enable = false;
      qt.enable = true;
      spicetify.enable = false;
      swaync.enable = false;
      vencord.enable = false;
      vscode.enable = false;
      waybar.enable = false;
    };

  };
}
