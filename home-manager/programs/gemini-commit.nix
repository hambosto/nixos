{
  config,
  lib,
  pkgs,
  ...
}:
let
  gemini-commit =
    with lib;
    let
      cfg = config.programs.gemini-commit;
      gemini-commit-module = pkgs.buildGoModule {
        pname = "geminicommit";
        version = "0.2.6";
        src = pkgs.fetchFromGitHub {
          owner = "tfkhdyt";
          repo = "geminicommit";
          rev = "e9cf48e8e0338b17eb38787c4f8dae0ddcc833fe";
          hash = "sha256-Jrs9X4qcD77W9uP/RvoxWWaMzRBNsH6M7bLsSAbsLlY=";
        };
        vendorHash = "sha256-+eKJLXgKuUHelUjD8MpMa+cRP+clmYK+1olcb/jmabk=";

        env.CGO_ENABLED = 0;

        ldflags = [
          "-extldflags '-static'"
          "-s -w"
        ];

        meta = with lib; {
          description = "A CLI that writes your git commit messages for you with Google Gemini AI";
          homepage = "https://github.com/tfkhdyt/geminicommit";
          license = licenses.gpl3Only;
          maintainers = [ maintainers.tfkhdyt ];
          platforms = platforms.all;
        };
      };
    in
    {
      options.programs.gemini-commit = {
        enable = mkEnableOption "Enable the go-encryption program";

        package = mkOption {
          type = types.package;
          default = gemini-commit-module;
          description = "The go-encryption package to use.";
        };
      };

      config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
      };
    };
in
{
  imports = [ gemini-commit ];

  programs.gemini-commit = {
    enable = true;
  };
}
