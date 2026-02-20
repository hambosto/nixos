{ lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = lib.concatStringsSep " " [
          (lib.getExe pkgs.tuigreet)
          "--remember"
          "--asterisks"
          "--time"
          "--cmd"
          (lib.getExe' pkgs.hyprland "start-hyprland")
        ];
        user = "greeter";
      };
    };
  };
}
