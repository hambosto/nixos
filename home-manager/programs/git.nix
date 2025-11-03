{ config, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      user = {
        email = "106536348+hambosto@users.noreply.github.com";
        name = "Ilham Putra Husada";
      };
      safe.directory = [ "${config.xdg.configHome}/nixos" ];
    };
  };
}
