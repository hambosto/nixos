{
  lib,
  pkgs,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = "${lib.getExe pkgs.tuigreet} --remember --asterisks --container-padding 2 --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
      };
    };
  };
}
