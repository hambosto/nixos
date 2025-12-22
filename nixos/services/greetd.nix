{ lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.tuigreet} --remember --asterisks --time --cmd ${lib.getExe' pkgs.niri-unstable "niri-session"}";
        user = "greeter";
      };
    };
  };
}
