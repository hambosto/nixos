{
  systemd.coredump = {
    enable = false;
    extraConfig = ''
      Storage=none
      ProcessSizeMax=0
    '';
  };
}
