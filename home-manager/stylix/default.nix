{
  lib,
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
      fish.enable = true;
      gtk.enable = true;
      hyprpaper.enable = lib.mkForce false;
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
