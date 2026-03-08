{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.opencode = {
    enable = true;
    settings = lib.mkMerge [
      {
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
        mcp.gh_grep = {
          type = "remote";
          url = "https://mcp.grep.app/";
          enabled = true;
          timeout = 10000;
        };
        lsp.rust = {
          command = [ (lib.getExe pkgs.rust-analyzer) ];
          extensions = [ ".rs" ];
        };
      })
    ];
  };
}
