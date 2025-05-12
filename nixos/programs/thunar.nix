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
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    home-manager.users.${username}.xdg.configFile."xfce4/helpers.rc".text =
      lib.mkIf config.programs.thunar.enable ''
        TerminalEmulator=kitty
      '';
  };
}
