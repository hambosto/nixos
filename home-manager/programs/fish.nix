{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
    shellAliases = {
      cat = "${lib.getExe config.programs.bat.package} --paging=never";
      tree = "${lib.getExe config.programs.eza.package} --icons=always --tree --no-quotes";
      ssh = "${lib.getExe config.programs.kitty.package} +kitten ssh";
    };
    interactiveShellInit = ''
      set fish_greeting
      if [ -z "$NVIM" ] && [ "$TERM_PROGRAM" != "vscode" ] && [ "$TERM_PROGRAM" != "zed" ]
          ${lib.getExe config.programs.fastfetch.package}
      end
    '';
  };
}
