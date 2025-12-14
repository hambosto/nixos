{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.zed-extensions.homeManagerModules.default ];

  programs.zed-editor = {
    enable = false;

    userSettings = {
      base_keymap = "VSCode";
      buffer_font_family = "Maple Mono NF";
      buffer_font_size = 14;
      buffer_font_weight = 500;
      buffer_line_height = {
        custom = 1.4;
      };
      current_line_highlight = "none";
      git = {
        inline_blame = {
          enabled = false;
        };
      };
      icon_theme = "Material Icon Theme";
      inlay_hints = {
        edit_debounce_ms = 700;
        enabled = true;
        scroll_debounce_ms = 50;
        show_background = false;
        show_other_hints = true;
        show_parameter_hints = true;
        show_type_hints = true;
      };
      languages = {
        Nix = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.nixfmt-rfc-style;
          language_servers = [ "nixd" ];
        };
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        Go = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.gosimports;
          language_servers = [ "gopls" ];
        };
      }
      // lib.optionalAttrs (config.programs.rust.enable or false) {
        Rust = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.rustfmt;
          language_servers = [ "rust-analyzer" ];
        };
      }
      // lib.optionalAttrs (config.programs.uv.enable or false) {
        Python = {
          format_on_save = "on";
          formatter.external = {
            arguments = [
              "-"
              "--quiet"
            ];
            command = lib.getExe pkgs.black;
          };
          language_servers = [ "pyright" ];
        };
      };

      lsp = {
        nixd = {
          binary.path = lib.getExe pkgs.nixd;
        };
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        gopls = {
          binary.path = lib.getExe pkgs.gopls;
        };
      }
      // lib.optionalAttrs (config.programs.rust.enable or false) {
        rust-analyzer = {
          binary.path = lib.getExe pkgs.rust-analyzer;
        };
      }
      // lib.optionalAttrs (config.programs.uv.enable or false) {
        pyright = {
          binary.path = lib.getExe pkgs.pyright;
        };
      };

      project_panel = {
        entry_spacing = "standard";
      };
      tabs = {
        file_icons = true;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      terminal = {
        blinking = "on";
        cursor_shape = "bar";
        font_family = "Maple Mono NF";
        font_size = 13;
      };
      theme = "Tokyo Night";
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };
      ui_font_family = "Maple Mono NF";
      ui_font_size = 14;
      ui_font_weight = 500;
    };
  };

  programs.zed-editor-extensions = {
    enable = config.programs.zed-editor.enable;
    packages =
      with pkgs.zed-extensions;
      (
        [
          html
          material-icon-theme
          nix
          tokyo-night
        ]
        ++ lib.optionals (config.programs.rust.enable or false) [
          crates-lsp
          toml
        ]
        ++ lib.optionals (config.programs.zig.enable or false) [ zig ]
      );
  };
}
