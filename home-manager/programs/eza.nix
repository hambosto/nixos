{
  programs.eza = {
    enable = true;
    icons = "auto";
    enableFishIntegration = true;

    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--git-ignore"
      "--icons=always"
    ];
  };
}
