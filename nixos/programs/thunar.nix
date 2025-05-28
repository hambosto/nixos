{
  config,
  lib,
  pkgs,
  username,
  ...
}:
{
  config = {
    programs.thunar = {
      enable = false;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    home-manager.users.${username}.xdg.configFile."xfce4/helpers.rc" =
      lib.mkIf config.programs.thunar.enable
        {
          text = ''
            TerminalEmulator=kitty
          '';
        };
  };
}
