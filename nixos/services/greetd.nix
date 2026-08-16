{ lib, pkgs, ... }:
let
  tomlFormat = pkgs.formats.toml { };
  configFile = {
    background.kind = "matrix";
    display = {
      align_greeting = "center";
      greeting = "Access is restricted to authorized personnel only.";
      issue = false;
      show_time = true;
    };
    layout = {
      container_padding = 1;
      prompt_padding = 1;
      widgets = {
        status_position = "bottom";
        time_position = "top";
      };
      width = 80;
      window_padding = 2;
    };
    power.use_setsid = false;
    remember = {
      session = true;
      user_session = true;
      username = true;
    };
    secret = {
      characters = "*";
      mode = "characters";
    };
    session.command = "${lib.getExe' pkgs.niri "niri-session"}";
    theme = {
      border = "white";
      text = "green";
      time = "blue";
      container = "black";
      title = "cyan";
      greet = "yellow";
      prompt = "magenta";
      input = "white";
      action = "bright-blue";
      button = "bright-red";
    };
  };
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.tuigreet} --config ${tomlFormat.generate "config.toml" configFile}";
        user = "greeter";
      };
    };
  };
}
