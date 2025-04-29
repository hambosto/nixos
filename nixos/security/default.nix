{
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.sudo.extraConfig = ''
    Defaults pwfeedback
    Defaults insults
  '';
}
