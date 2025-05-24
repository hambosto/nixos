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
        version = "0.4.0";
        src = pkgs.fetchFromGitHub {
          owner = "tfkhdyt";
          repo = "geminicommit";
          rev = "414112c4bcffebd1c93688de80f0a9d7cdfa0cb9";
          hash = "sha256-fwcS3+lbUGJ6BK43HHAzO2sM9JQ1sNA+xXHYa02EbJQ=";
        };
        vendorHash = "sha256-IfqlPg+HPcOfjlwwuLi2/R21UD83xQzWyUmzM7JSDEs=";

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
