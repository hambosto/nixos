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
      firefox = {
        enable = true;
        firefoxGnomeTheme.enable = true;
        profileNames = [ "default" ];
      };
      fish.enable = true;
      gtk.enable = true;
      hyprland.hyprpaper.enable = true;
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
