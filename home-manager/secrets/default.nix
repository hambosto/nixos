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
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/ilham/.config/sops/age/keys.txt";

    secrets = {
      gemini = { };
      gh-oauth-token = lib.mkIf config.programs.gh.enable { };
    };

    templates = {
      geminicommit = {
        content = builtins.readFile (
          tomlFormat.generate "config.toml" {
            api = {
              key = config.sops.placeholder.gemini;
              model = "gemini-2.5-flash";
            };
            behavior = {
              auto_select = false;
              dry_run = false;
              no_confirm = false;
              no_verify = false;
              push = false;
              quiet = false;
              show_diff = false;
              stage_all = false;
            };
            commit = {
              language = "english";
              max_length = 72;
            };
          }
        );
        path = "${config.xdg.configHome}/geminicommit/config.toml";
      };

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
    };
  };
}
