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
        formatter = {
          nixfmt = {
            command = [ (lib.getExe pkgs.nixfmt) ];
            extensions = [ ".nix" ];
          };
        };
        lsp = {
          nixd = {
            command = [ (lib.getExe pkgs.nixd) ];
            extensions = [ ".nix" ];
          };
        };
        mcp = {
          deepwiki = {
            type = "remote";
            url = "https://mcp.deepwiki.com/mcp";
            enabled = true;
            timeout = 10000;
          };
          context7 = {
            type = "remote";
            url = "https://mcp.context7.com/mcp";
            enabled = true;
            timeout = 10000;
          };
          gh_grep = {
            type = "remote";
            url = "https://mcp.grep.app/";
            enabled = true;
            timeout = 10000;
          };
          nixos = {
            type = "local";
            command = [ (lib.getExe pkgs.mcp-nixos) ];
            enabled = true;
          };
        };
      }
      (lib.mkIf (config.programs.rust.enable or false) {
        formatter.rustfmt = {
          command = [ (lib.getExe pkgs.rustfmt) ];
          extensions = [ ".rs" ];
        };
        mcp.docs-mcp = {
          type = "local";
          command = [ (lib.getExe pkgs.docs-mcp) ];
          enabled = true;
        };
        lsp.rust-analyzer = {
          command = [ (lib.getExe pkgs.rust-analyzer) ];
          extensions = [ ".rs" ];
        };
      })
    ];
    skills = lib.mkMerge [
      {
        frontend-design = "${pkgs.anthropics-skills}/skills/frontend-design/";
      }
      (lib.mkIf (config.programs.rust.enable or false) {
        rust-skills = "${pkgs.rust-skills}";
      })
    ];
  };
}
