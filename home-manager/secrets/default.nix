{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  tomlFormat = pkgs.formats.toml { };
  yamlFormat = pkgs.formats.yaml { };
in
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/ilham/.config/sops/age/keys.txt";

    secrets = {
      gh-oauth-token = lib.mkIf config.programs.gh.enable { };
      openrouter-api-key = { };
    };

    templates = {
      gh = lib.mkIf config.programs.gh.enable {
        content = builtins.readFile (
          yamlFormat.generate "hosts.yml" {
            "github.com" = {
              users = {
                hambosto = {
                  oauth_token = config.sops.placeholder.gh-oauth-token;
                };
              };
              git_protocol = "ssh";
              oauth_token = config.sops.placeholder.gh-oauth-token;
              user = "hambosto";
            };
          }
        );
        path = "${config.xdg.configHome}/gh/hosts.yml";
      };

      gcop-rs = {
        content = builtins.readFile (
          tomlFormat.generate "config.toml" {
            llm = {
              default_provider = "openrouter";
              providers = {
                openrouter = {
                  api_style = "openai";
                  api_key = config.sops.placeholder.openrouter-api-key;
                  endpoint = "https://openrouter.ai/api/v1/chat/completions";
                  model = "minimax/minimax-m2.5:free";
                  temperature = 0.3;
                };
              };
            };

            commit = {
              show_diff_preview = true;
              allow_edit = true;
            };

            ui = {
              colored = true;
              streaming = true;
              language = "en";
            };
          }
        );
        path = "${config.xdg.configHome}/gcop/config.toml";
      };
    };
  };
}
