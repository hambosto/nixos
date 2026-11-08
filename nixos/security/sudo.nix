{
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    extraConfig = ''
      Defaults insults
      Defaults lecture = never
      Defaults pwfeedback
    '';
  };
}
