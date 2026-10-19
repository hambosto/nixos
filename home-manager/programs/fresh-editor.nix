{ lib, pkgs, ... }:
{
  programs.fresh-editor = {
    enable = false;
    settings = {
      theme = "dark";
      editor = {
        line_wrap = false;
        nerd_font_icons = true;
        cursor_style = "steady_bar";
        cursor_jump_animation = false;
        indentation_guide = "all";
        indentation_guide_glyph = "╎";
        completion_popup_auto_show = true;
        diagnostics_inline_text = true;
        restore_previous_session = false;
      };
      plugins = {
        k8s-workspace.enabled = false;
        welcome_screen.enabled = false;
        agent_sessions.enabled = false;
        agent_sessions_codex.enabled = false;
        agent_discovery.enabled = false;
        welcome.enabled = false;
        devcontainer.enabled = false;
        dashboard.enabled = false;
        agent_sessions_claude_code.enabled = false;
        agent_sessions_multiplexers.enabled = false;
        live_sessions.enabled = false;
        orchestrator.enabled = false;
      };

      lsp = {
        nix = {
          command = lib.getExe pkgs.nixd;
          enabled = true;
        };
      };

      languages = {
        nix = {
          format_on_save = true;
          formatter = {
            command = lib.getExe pkgs.nixfmt;
            stdin = true;
          };
        };
      };
    };
  };
}
