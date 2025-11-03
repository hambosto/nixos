{
  security.doas = {
    enable = true;
    extraRules = [
      {
        keepEnv = true;
        persist = true;
        users = [ "ilham" ];
        groups = [ "wheel" ];
      }
    ];
  };
}
