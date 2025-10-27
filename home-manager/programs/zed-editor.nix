{ lib, pkgs, ... }:
{
  programs.zed-editor = {
    enable = false;
    extensions = [
      "tokyo-night"
      "material-icon-theme"
      "nix"
    ];
    userSettings = {
      icon_theme = "Material Icon Theme";
      theme = "Tokyo Night";
      buffer_font_size = 13;
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_line_height = {
        custom = 1.4;
      };
      git = {
        inline_blame = {
          enabled = false;
        };
      };
      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 14;
      base_keymap = "VSCode";
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };
      project_panel = {
        entry_spacing = "standard";
      };
      current_line_highlight = "none";
      tabs = {
        file_icons = true;
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = false;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
      };
      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        font_size = 13;
        blinking = "on";
        cursor_shape = "bar";
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      lsp = {
        gopls = {
          binary.path = lib.getExe pkgs.gopls;
        };

        nixd = {
          binary.path = lib.getExe pkgs.nixd;
        };

        pyright = {
          binary.path = lib.getExe pkgs.pyright;
        };

        rust-analyzer = {
          binary.path = lib.getExe pkgs.rust-analyzer;
        };
      };

      languages = {
        Go = {
          language_servers = [ "gopls" ];
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.gosimports;
        };
        Nix = {
          language_servers = [ "nixd" ];
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.nixfmt-rfc-style;
        };
        Python = {
          language_servers = [ "pyright" ];
          format_on_save = "on";
          formatter.external = {
            command = lib.getExe pkgs.black;
            arguments = [
              "-"
              "--quiet"
            ];
          };
        };
        Rust = {
          language_servers = [ "rust-analyzer" ];
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.rustfmt;
        };
      };
    };
  };
}
