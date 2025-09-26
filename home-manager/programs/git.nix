{
  programs.git = {
    enable = true;
    difftastic.enable = true;
    userName = "hambosto";
    userEmail = "106536348+hambosto@users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
    };
  };
}
