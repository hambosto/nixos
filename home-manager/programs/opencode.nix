{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.opencode = {
    enable = false;
    context = ''
      # RTK - Rust Token Killer (OpenCode)

      **Usage**: Token-optimized CLI proxy for shell commands.

      ## Rule

      Always prefix shell commands with `${lib.getExe pkgs.rtk}` to minimize token consumption.

      Examples:

      ```bash
      ${lib.getExe pkgs.rtk} git status
      ${lib.getExe pkgs.rtk} cargo test
      ${lib.getExe pkgs.rtk} ls src/
      ${lib.getExe pkgs.rtk} grep "pattern" src/
      ${lib.getExe pkgs.rtk} find "*.rs" .
      ${lib.getExe pkgs.rtk} docker ps
      ${lib.getExe pkgs.rtk} gh pr list
      ```

      ## Meta Commands

      ```bash
      ${lib.getExe pkgs.rtk} gain              # Show token savings
      ${lib.getExe pkgs.rtk} gain --history    # Command history with savings
      ${lib.getExe pkgs.rtk} discover          # Find missed RTK opportunities
      ${lib.getExe pkgs.rtk} proxy <cmd>       # Run raw (no filtering, for debugging)
      ```

      ## Why

      RTK filters and compresses command output before it reaches the LLM context, cutting up to 90% of the bash output on common operations. Always use `${lib.getExe pkgs.rtk} <cmd>` instead of raw commands.
    '';

    settings = {
      experimental = {
        disable_paste_summary = true;
      };
      mcp = lib.mkMerge [
        (lib.mkIf config.programs.rust.enable {
          crates-docs = {
            enabled = true;
            command = [
              "${lib.getExe pkgs.crates-docs}"
              "serve"
              "--mode"
              "stdio"
            ];
            type = "local";
          };
        })
      ];
    };

    skills = lib.mkMerge [
      (lib.mkIf config.programs.rust.enable {
        rust-skills = "${pkgs.rust-skills}";
      })
    ];
  };
}
