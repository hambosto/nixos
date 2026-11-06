{
  services.journald.settings.Journal = {
    Storage = "none";
    ForwardToSyslog = false;
    ForwardToKMsg = false;
    ForwardToConsole = false;
    ForwardToWall = false;
  };
}
