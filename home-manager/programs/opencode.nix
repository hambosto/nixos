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
      # RTK - Rust Token Killer

      **Usage**: Token-optimized CLI proxy for shell commands.

      ## Rule (MANDATORY)

      You MUST prefix every shell command with `${lib.getExe pkgs.rtk}` before executing it. This is not optional.

      **Before running ANY shell command, ask: "Did I prefix this with rtk?" If no, stop and add it.**

      ### Correct

      ```bash
      ${lib.getExe pkgs.rtk} git status
      ${lib.getExe pkgs.rtk} cargo test
      ${lib.getExe pkgs.rtk} cargo build --release
      ${lib.getExe pkgs.rtk} ls src/
      ${lib.getExe pkgs.rtk} grep -r "pattern" src/
      ${lib.getExe pkgs.rtk} find . -name "*.rs"
      ${lib.getExe pkgs.rtk} docker ps
      ${lib.getExe pkgs.rtk} gh pr list
      ${lib.getExe pkgs.rtk} cat Cargo.toml
      ```

      ### Incorrect — do not do this

      ```bash
      git status     # ❌ missing rtk prefix
      cargo test     # ❌ wastes tokens on raw output
      cat Cargo.toml # ❌ should go through rtk
      ```

      ## Exceptions

      The ONLY time you should run a command without the `${lib.getExe pkgs.rtk}` prefix is:
      - You are explicitly debugging RTK itself and need raw output — use `${lib.getExe pkgs.rtk} proxy <cmd>` for this, not a bare command.
      - `${lib.getExe pkgs.rtk}` is not found on PATH — in that case, state this explicitly before falling back to a raw command for that call.

      ## Meta Commands

      ```bash
      ${lib.getExe pkgs.rtk} gain           # Show token savings
      ${lib.getExe pkgs.rtk} gain --history # Command history with savings
      ${lib.getExe pkgs.rtk} discover       # Find missed RTK opportunities
      ${lib.getExe pkgs.rtk} proxy <cmd>    # Run raw (no filtering, for debugging only)
      ```

      ## Why

      RTK filters and compresses command output before it reaches context, saving 60-90% of tokens on common operations (git, cargo, grep, find, docker, gh, etc.). Every raw command run instead of `rtk <cmd>` is wasted context budget. Default to `rtk` reflexively, the same way you'd check a file exists before editing it.
    '';
    settings = lib.mkMerge [
      (lib.mkIf (config.programs.rust.enable or false) {
        mcp.crates-docs = {
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
    skills = lib.mkMerge [
      (lib.mkIf (config.programs.rust.enable or false) {
        rust-skills = "${pkgs.rust-skills}";
      })
    ];
  };
}
