{
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "hard";
      item = "core";
      value = "0";
    }
    {
      domain = "*";
      type = "soft";
      item = "core";
      value = "0";
    }
  ];
  security.pam.services.hyprlock = { };
}
