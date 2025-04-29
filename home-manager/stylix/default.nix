{
  pkgs,
  username,
  ...
}:
{
  stylix = {
    iconTheme = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
      light = "Adwaita";
    };

    targets = {
      vscode.enable = false;
      waybar.enable = false;
      qt.enable = true;
      gtk.enable = true;
      firefox = {
        enable = true;
        profileNames = [ username ];
        firefoxGnomeTheme.enable = true;
      };
    };
  };
}
