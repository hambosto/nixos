{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.opencode = {
    enable = false;
    settings = lib.mkMerge [
      (lib.mkIf (config.programs.rust.enable or false) {
        mcp.docs-mcp = {
          type = "local";
          command = [ (lib.getExe pkgs.docs-mcp) ];
          enabled = true;
        };
      })
    ];
    skills = lib.mkMerge [
      (lib.mkIf (config.programs.rust.enable or false) {
        rust-skills = "${pkgs.rust-skills}";
      })
    ];
  };
}
