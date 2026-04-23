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
      {
        mcp = {
          nixos = {
            type = "local";
            command = [ (lib.getExe pkgs.mcp-nixos) ];
            enabled = true;
          };
        };
      }
      (lib.mkIf (config.programs.rust.enable or false) {
        mcp.docs-mcp = {
          type = "local";
          command = [ (lib.getExe pkgs.docs-mcp) ];
          enabled = true;
        };
      })
    ];
    skills = lib.mkMerge [
      {
        # frontend-design = "${pkgs.anthropics-skills}/skills/frontend-design/";
      }
      (lib.mkIf (config.programs.rust.enable or false) {
        rust-skills = "${pkgs.rust-skills}";
      })
    ];
  };
}
