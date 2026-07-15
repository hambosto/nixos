{
  services.journald.extraConfig = ''
    SystemMaxUse=20M
    RuntimeMaxUse=5M
  '';
}
