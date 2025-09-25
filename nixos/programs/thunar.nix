{
  config,
  lib,
  pkgs,
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

    home-manager.users.ilham.xdg.configFile."xfce4/helpers.rc" =
      lib.mkIf config.programs.thunar.enable
        {
          text = ''
            TerminalEmulator=kitty
          '';
        };
  };
}
