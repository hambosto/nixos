{
  config,
  inputs,
  pkgs,
  ...
}:
let
  tomlFormat = pkgs.formats.toml { };
in
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/ilham/.config/sops/age/keys.txt";

    secrets = {
      gemini = { };
    };

    templates.geminicommit = {
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
            show_diff = true;
            stage_all = false;
          };
          commit = {
            language = "english";
            max_length = 72;
          };
        }
      );
      path = "${config.home.homeDirectory}/.config/geminicommit/config.toml";
    };
  };
}
